using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Travel_Agent_WebApp_JoseRodriguez.CurrencyExchangeRate_ServiceReference;

namespace Travel_Agent_WebApp_JoseRodriguez
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        //Declaring a static connection string to create the connection object to communicate with database
        static string ConnectionString = "Data Source=MILLENIUMHAWCK\\HDIP;Initial Catalog=Travel_Agent_DB;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        //As price will cahnge constanly (due to diffenrent currencies), it might be a good idea to query the database only once and store 
        //the retrieved prices permanently in this page so any time the need to be accessed no more connection
        //to the database is required.
        static decimal fiveDayPrice;
        static decimal nineDayPrice;

        #region EVENT HANDLERS
        protected void Page_Load(object sender, EventArgs e)
        {
            //Once the page is loaded the price for each tour should be updated
            //A query to The database Travel_Agent_DB has to be sent.
            //As this data applies only when the page is loaded not as a consecuence of 
            // changing the currency to shown, it is necessary to check there is no post back for this page

            if (!this.IsPostBack)
            {
                ListItem[] tours = new ListItem[2];
                cbxTours.Items.CopyTo(tours, 0);
                fiveDayPrice = GetPriceByID(Convert.ToInt32(tours[0].Value));
                nineDayPrice = GetPriceByID(Convert.ToInt32(tours[1].Value));
                lblFiveDayPrice.Text = string.Format("{0:F}",fiveDayPrice);
                lblNineDayPrice.Text = string.Format("{0:F}",nineDayPrice);
            }// End of checking it is not a post back
        }// End of load event handler

        protected void BookButton_Click(object sender, EventArgs e)
        {
            //Clear previous error message
            lblErrorMsg.Text = "";
            //Check there is one option ticked off at least and the number of people is greated than one
            if (cbxTours.SelectedItem != null)
            {
                //In case there is one option ticked off check the number of people is greater than zero
                if (Convert.ToInt32(ddlNoOfPeople.SelectedItem.Text) > 0)
                {
                    Server.Transfer("BookingForm.aspx");
                }
                else
                {
                    //Show error message for number of people not greater than zero
                    lblErrorMsg.Text = "Number of people to book in has to be greater than zero, please check your choice";
                    ErrorMsgConfig();

                }// End of if else statement to check number of people is correct

            }
            else
            {// if no option for the tours is checked
                //Show error message
                lblErrorMsg.Text = "No option has been selected. Please, tick one tour off at least.";
                ErrorMsgConfig();
            }// End of if if else statement to check a tour has been ticked off
        }// End of click event handler for book button

        protected void ddlCurrencyPicker_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Create new ServiceClient object to get access to serice methods
            Service1Client ExchangeRateClient = new Service1Client();

            //Default currency is Euro so currencyFrom name will alwayas be "Euro" for this website
            //Check theere is one currency selected from the drop down menu
            if (this.ddlCurrencyPicker.SelectedItem != null)
            {
                //Define the name of the currency based on the Value stored in the ListItem object.
                string currencyTo;
                switch (ddlCurrencyPicker.SelectedItem.Value)
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
                    double exchangeRate = ExchangeRateClient.ExchangeRateCalculator("Euro", currencyTo, DateTime.Today);

                    /*Use the exchange rate to calculate new prices and update data displayes in website
                      Considereing the exchange rate will be zero if an error comes up, it is important to check
                      the retrieved currency exchange rate is not zero, which makes no sense in this context*/
                    if (exchangeRate != 0)
                    {
                        decimal newPrice = fiveDayPrice * (decimal)exchangeRate;
                        lblFiveDayPrice.Text = string.Format("{0:F2}", newPrice);
                        newPrice = nineDayPrice * (decimal)exchangeRate;
                        lblNineDayPrice.Text = string.Format("{0:F2}", newPrice);
                    }
                    else
                    {
                        //Show error Message
                        ErrorMsgConfig();
                        this.lblErrorMsg.Text = "Error retriving currency exchange rate. Price shown in Euro (€).";
                    }//End of error checking for exchange rate returned
                }
                else
                {
                    lblFiveDayPrice.Text = string.Format("{0:F2}", fiveDayPrice);
                    lblNineDayPrice.Text = string.Format("{0:F2}", nineDayPrice);
                }//End of if else statement to check the currency selected by user
            }// End of currency selection checking
            // Always close the client.
            ExchangeRateClient.Close();
        }// End of event handler for currency selection changed
#endregion

        #region HELPER METHODS
        private void ErrorMsgConfig()
        {
            lblErrorHeading.Text = "Error:";
            lblErrorMsg.BorderColor = Color.Red;
            lblErrorMsg.BorderStyle = BorderStyle.Outset;
        }//End of ErrorMsgConfig method

        //Method to query the database and get the current price for a specific tour
        private decimal GetPriceByID(int packageID)
        {
            decimal price = 0;
            // A connection object to connect to the database defined by my connection string 
            SqlConnection connenctionObject = new SqlConnection(ConnectionString);
            // This object sends commands to the database
            SqlCommand commandObject = new SqlCommand();
            try
            {
                //Open the database connection
                connenctionObject.Open();
                //Link the command object with the conneciton object
                commandObject.Connection = connenctionObject;

                // Define the sql text with the query necessary to get the zone for a particular tour code stored in the list of tours ticked off
                commandObject.CommandText = string.Format("SELECT PackageItemID,Price FROM PackageItems WHERE PackageItemID = {0}", packageID);
                //Define an object to recieve data retrieved and execute the query
                SqlDataReader priceRetrieved = commandObject.ExecuteReader();
                if (priceRetrieved.Read())
                {
                    price = Convert.ToDecimal(priceRetrieved["Price"].ToString());
                }
                return price;
            }
            catch
            {
                //Show error 
                this.lblErrorMsg.Text = "Error while retrieving tour prices. Operation unsuccessful!";
                ErrorMsgConfig();
                return price;
            }
            finally
            { //Close the database connection object
                connenctionObject.Close();
            }
        }//End of GetPriceByID method
        #endregion
    }

}