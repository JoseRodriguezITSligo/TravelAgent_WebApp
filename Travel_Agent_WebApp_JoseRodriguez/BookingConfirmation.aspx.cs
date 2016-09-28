using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Travel_Agent_WebApp_JoseRodriguez.CurrencyExchangeRate_ServiceReference;

namespace Travel_Agent_WebApp_JoseRodriguez
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        //Declaring a static connection string to create the connection object to communicate with database
        static string connectionString = "Data Source=MILLENIUMHAWCK\\HDIP;Initial Catalog=Travel_Agent_DB;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        protected void Page_Load(object sender, EventArgs e)
        {
            //Check if a previous page does exist
            if (this.PreviousPage !=null) {
                //Copy departure date as it is used in the confirmation code generation process
                Calendar calDepartureDateClone = (Calendar)this.PreviousPage.Master.FindControl("ContentPlaceHolder1").FindControl("calDepartureDate");
                if (calDepartureDateClone != null)
                {
                    this.lblDate.Text = calDepartureDateClone.SelectedDate.ToShortDateString();
                }
                //Get the confirmation number and display it in the corresponding label
                lblConfirmationNumber.Text = GenerateConfirmationNumber();
                //Update the last booking record in the Bookings table with the confirmation number
                if (UpdateConfirmationCode(lblConfirmationNumber.Text))
                {
                    //Clone previous page controls

                    //Customer Details
                    TextBox tbxFNameClone = (TextBox)this.PreviousPage.Master.FindControl("ContentPlaceHolder1").FindControl("tbxFName");
                    TextBox tbxSurnameClone = (TextBox)this.PreviousPage.Master.FindControl("ContentPlaceHolder1").FindControl("tbxSurname");
                    TextBox tbxPhoneClone = (TextBox)this.PreviousPage.Master.FindControl("ContentPlaceHolder1").FindControl("tbxPhone");
                    TextBox tbxEmailClone = (TextBox)this.PreviousPage.Master.FindControl("ContentPlaceHolder1").FindControl("tbxEmail");

                    //Booking Details
                    CheckBoxList cbxToursClone = (CheckBoxList)this.PreviousPage.Master.FindControl("ContentPlaceHolder1").FindControl("cbxTours");
                    DropDownList ddlNoOfPeopleClone = (DropDownList)this.PreviousPage.Master.FindControl("ContentPlaceHolder1").FindControl("ddlNumOfPeople");
                    

                    //Total detials
                    DropDownList ddlCurrencyClone = (DropDownList)this.PreviousPage.Master.FindControl("ContentPlaceHolder1").FindControl("ddlCurrencyPicker");
                    Label lblTotalClone = (Label)this.PreviousPage.Master.FindControl("ContentPlaceHolder1").FindControl("lblTotal");

                    //Use data from previous page and display details in the confirmation page
                    //Customer Details related controls
                    if (tbxFNameClone != null && tbxFNameClone.Text != "")
                    {
                        this.lblFirstName.Text = tbxFNameClone.Text;
                    }
                    if (tbxSurnameClone != null && tbxSurnameClone.Text != "")
                    {
                        this.lblSurname.Text = tbxSurnameClone.Text;
                    }
                    if (tbxPhoneClone != null && tbxPhoneClone.Text != "")
                    {
                        this.lblPhone.Text = tbxPhoneClone.Text;
                    }
                    if (tbxEmailClone != null && tbxEmailClone.Text != "")
                    {
                        this.lblEmail.Text = tbxEmailClone.Text;
                    }
                    //Booking Details
                    if (cbxToursClone != null)
                    {
                        //Get package itemID and then query the database to obtain its description
                        int packageItemID = GetPackageItemID(cbxToursClone);
                        //Invoke method to query database and get name of package
                        lblPackage.Text = GetPackageName(packageItemID);
                        //Copy tours name from ddlToursClone and assign them to corresponding labels
                        List<string> namesList = new List<string>();
                        namesList = GetToursNames(cbxToursClone.Items);
                        if (namesList.Count == 1)
                        {
                            lblTour1.Text = namesList.First();
                        }
                        else if (namesList.Count == 2)
                        {
                            lblTour1.Text = namesList.First();
                            lblTour2.Text = namesList.ElementAt(1);
                        }
                        else if (namesList.Count == 3)
                        {
                            lblTour1.Text = namesList.First();
                            lblTour2.Text = namesList.ElementAt(1);
                            lblTour3.Text = namesList.ElementAt(2);
                        }
                    }// End of if statement to check cbxTours is not null
                    if (ddlNoOfPeopleClone != null)
                    {
                        this.lblNoOfPeople.Text = ddlNoOfPeopleClone.SelectedItem.Text;
                    }
                    if (calDepartureDateClone != null)
                    {
                        this.lblDate.Text = calDepartureDateClone.SelectedDate.ToShortDateString();
                    }
                    //Total detials
                    if (ddlCurrencyClone != null)
                    {
                        this.lblCurrency.Text = ddlCurrencyClone.SelectedItem.Text;
                    }
                    if (lblTotalClone != null)
                    {
                        this.lblTotal.Text = lblTotalClone.Text;
                    }// End of if statements to check control are not null and assign text to each label

                    //Get the exchange rate applied and format it and display it in the corresponding label
                    lblExchangeRate.Text = string.Format("{0:F2}", GetExchangeRate(ddlCurrencyClone));
                }
                else {// If update is not possible an error message is displayed
                    lblConfirmationNumber.Text = "Error while updating the confirmation code! Contact the Travel Agent for your confirmation.";
                }// End of if statement to check confirmation code was inserted in booking record

            }// End of if statement to check if previous page is null

        }// End page load event handler

        #region HELPER METHODS
        //Check the number of items ticked off for list of tours (cbxTours)
        private int NumberOfToursSelected(CheckBoxList list)
        {
            //Declare and Initialize counter
            int counter = 0;
            //foreach loop to go through the whole list of items 
            foreach (ListItem tour in list.Items)
            {
                //Checks each item to see if it is selected or not
                if (tour.Selected)
                {
                    //In case it is selected increase the counter by one
                    counter++;
                }// End of if statement to check selection
            }// End of foreach loop to go through the list of tours
            return counter;
        }// End of NumberOfToursSelected method

        //Method to get the id of a package
        private int GetPackageItemID(CheckBoxList list)
        {
            int packageItemID;
           
            int toursQty = this.NumberOfToursSelected(list);
            if (toursQty == 1)
            {
                packageItemID = Convert.ToInt32(list.SelectedItem.Value);
            }
            else if (toursQty == 2)
            {
                packageItemID = 11;
            }
            else if (toursQty == 3)
            {
                packageItemID = 12;
            }
            else
            {
                packageItemID = 0;
            }
            return packageItemID;
        }// End of GetPackageItemID method

        //Method to get the name of a package
        private string GetPackageName(int packageItemID) {
            //variable to store the retrieved name
            string name;
            // A connection object to connect to the database defined by my connection string 
            SqlConnection connenctionObject = new SqlConnection(connectionString);
            // This object sends commands to the database
            SqlCommand commandObject = new SqlCommand();
            try {
                //Open the database connection
                connenctionObject.Open();
                //Link the command object with the conneciton object
                commandObject.Connection = connenctionObject;

                //Define the sql text with the query necessary to get the zone for a particular tour code stored in the list of tours ticked off
                commandObject.CommandText = string.Format("SELECT Packages.Name FROM PackageItems JOIN Packages ON PackageItems.PackageID = Packages.PackageID WHERE PackageItemID = {0}", packageItemID);
                SqlDataReader nameRetrieved = commandObject.ExecuteReader();
                if (nameRetrieved.Read())
                {
                    name = nameRetrieved["Name"].ToString();
                }
                else
                {
                    name = "Error retrieving data from database.";
                }
                return name;
            }
            catch { return name = "Error retrieving data from database."; }
            finally {
                //Close the database connection object
                connenctionObject.Close();
            }       
        }// End of GetPackageName method

        //Method to calculate the excahnge rate of a currency vs th Euro
        private double GetExchangeRate(DropDownList CurrencyList)
        {
            //Default currency is Euro so currencyFrom name will alwayas be "Euro" for this website
            //Check theere is one currency selected from the drop down menu
            if (CurrencyList.SelectedItem != null)
            {
                // Create new ServiceClient object to get access to serice methods
                Service1Client ExchangeRateClient = new Service1Client();
                //Define the name of the currency based on the Value stored in the ListItem object.
                string currencyTo;
                double exchangeRate;
                switch (CurrencyList.SelectedItem.Value)
                {
                    case "1":
                        currencyTo = "Euro";
                        break;
                    case "2":
                        currencyTo = "Pound";
                        break;
                    case "3":
                        currencyTo = "Dollar";
                        break;
                    case "4":
                        currencyTo = "Bolivar";
                        break;
                    default:
                        currencyTo = "Euro";
                        break;
                }//End of switch statement

                //If the new item selecte is Euro no currency conversion is required. Data has to be retrieved from database
                if (!currencyTo.Trim().ToLower().Equals("euro"))
                {
                    // Use the 'client' variable to call operations on the service.
                    exchangeRate = ExchangeRateClient.ExchangeRateCalculator("Euro", currencyTo, DateTime.Today);
                }
                else
                {
                    exchangeRate = 1;
                }// End of if else statement to check if Euro was not selected

                // Always close the client.
                ExchangeRateClient.Close();
                return exchangeRate;
            }
            else
            {
                return 0;
            }// End of if statement to check a valid currency is selected
        }// End of GetExchangeRate method

        //Method to get the descriptions of all tours selected by user in previous page
        private List<string> GetToursNames(ListItemCollection list) {
            List<string> namesList = new List<string>();
            foreach (ListItem tour in list) {
                if (tour.Selected) {
                    namesList.Add(tour.Text);
                }
            }// End of foureach loop
            return namesList;
        }//End of GetToursNames method

        //Method to generate confirmation number after a booking has been processed
        private string GenerateConfirmationNumber() {
            string confirmationNumber;
            confirmationNumber = string.Format("TRSVZLA{0}CONF-{1}", lblDate.Text,GetLastIdentity("SELECT MAX(BookingID) AS LastID FROM Bookings"));
            return confirmationNumber;
        }// End of GenerateConfirmationNumber method

        //Method to get the ID of last customer inserted in Customers table
        private int GetLastIdentity(string query)
        {
            // A connection object to connect to the database defined by my connection string 
            SqlConnection connenctionObject = new SqlConnection(connectionString);
            // This object sends commands to the database
            SqlCommand commandObject = new SqlCommand();
            int maxID = -1;
            try
            {
                //Open the database connection
                connenctionObject.Open();
                //Link the command object with the conneciton object
                commandObject.Connection = connenctionObject;
                //Set query text 
                commandObject.CommandText = query;
                SqlDataReader CustomerIDRetrieved = commandObject.ExecuteReader();
                if (CustomerIDRetrieved.Read())
                {
                    maxID = Convert.ToInt32(CustomerIDRetrieved["LastID"].ToString());
                }
                return maxID;
            }//End of GetLastCustomerID method
            catch { return maxID;}
            finally
            {
                //Close the connection to database
                connenctionObject.Close();
            }
        }// End of GetLastIdentity method

        private bool UpdateConfirmationCode(string code) {
            //variable to store the retrieved name
            bool UpdateSuccessful=false;
            // A connection object to connect to the database defined by my connection string 
            SqlConnection connenctionObject = new SqlConnection(connectionString);
            // This object sends commands to the database
            SqlCommand cmd = new SqlCommand();
            try
            {
                //Open the database connection
                connenctionObject.Open();
                //Link the command object with the conneciton object
                cmd.Connection = connenctionObject;

                //Define the sql text with the query necessary to get the zone for a particular tour code stored in the list of tours ticked off
                cmd.CommandText = "spUpdateConfirmationCode";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Code",code);
                cmd.Parameters.AddWithValue("@BookingID", GetLastIdentity("SELECT MAX(BookingID) AS LastID FROM Bookings"));
                // Use the method to send the command to the database
                cmd.ExecuteNonQuery();
                return UpdateSuccessful = true;
            }
            catch { return UpdateSuccessful = false; }
            finally
            {
                //Close the database connection object
                connenctionObject.Close();
            }

        }// End of UpdateConfirmationCode
        #endregion
    }// End of class
}// End of namespace