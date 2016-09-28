using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Travel_Agent_WebApp_JoseRodriguez.CurrencyExchangeRate_ServiceReference;

namespace Travel_Agent_WebApp_JoseRodriguez
{
    
    public partial class WebForm13 : System.Web.UI.Page
    {
        //Declaring a static connection string to create the connection object to communicate with database
        static string connectionString = "Data Source=MILLENIUMHAWCK\\HDIP;Initial Catalog=Travel_Agent_DB;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        //Variable used to store the number of credit card when TryParse function is used
        private long noCard;
        private short noCVV;

        #region EVENT HANDLERS
        // Event handler for the page load event
        protected void Page_Load(object sender, EventArgs e)
        {
            #region CrossPage Posting
            if (!this.IsPostBack) { 
            //When the booking form page is loaded the first thing to do is to check for a previous page
            // and copy the controls used to get the user's input.
            //As this form can only be access from one of the five destination pages, a previous page
            //should always exist, even though an if statement to check that property is not null is used.
                if (this.PreviousPage != null) {
                    //Make a copy of the controls used on the previous page so the can be available in the current page
                    CheckBoxList cbxToursPP = (CheckBoxList)this.PreviousPage.Master.FindControl("ContentPlaceHolder1").FindControl("cbxTours"); //this.PreviousPage.FindControl("cbxTours");
                    if (cbxToursPP != null)
                    {
                        //As the checkbox list in previos page had only two items and the current has 10, 
                        // it will be necessary to inspect the selected items and tick off the same tours in the 10 item list
                        // The method below receives the checkbox list cloned from the Previous Page and does the job
                        ToursSelected(cbxToursPP);
                    }

                    DropDownList ddlNumOfPeopleClone = (DropDownList)this.PreviousPage.Master.FindControl("ContentPlaceHolder1").FindControl("ddlNoOfPeople");
                    if (ddlNumOfPeopleClone != null)
                    {
                        //As the range for both ddl are the same the previous ddl can be  copied into the current one 
                        this.ddlNumOfPeople.SelectedIndex = ddlNumOfPeopleClone.SelectedIndex;
                    }//End if statement to check the dropdown list control was  not null

                    DropDownList ddlCurrencyClone = (DropDownList)this.PreviousPage.Master.FindControl("ContentPlaceHolder1").FindControl("ddlCurrencyPicker");
                    if (ddlCurrencyClone!=null) {
                        this.ddlCurrencyPicker.SelectedIndex = ddlCurrencyClone.SelectedIndex;
                    }// End of if statement to check the currency picker drop down list is not null

                }// End of if statement to check Previous Page is not null
            
                //Since selection from previous page should be copied into this new page a total could be calculated.
                //Check that one tour at least has been ticked off and number of people is greater than zero.
                if (this.cbxTours.SelectedItem != null && NumberOfToursSelected() < 4)
                {
                    //Check if the number of people to be booked in is greater than zero
                    if (Convert.ToInt32(this.ddlNumOfPeople.SelectedItem.Text) > 0)
                    {
                        if (ddlCurrencyPicker.SelectedIndex == 0)
                        {
                            //Call method that updates all details about the price for this booking
                            UpdateTotalBooking();
                        }
                        else {
                            //Call method to update the price when other currency than Euro is selected
                            this.ddlCurrency_SelectedIndexChanged(ddlCurrencyPicker,new EventArgs());
                        }
                    }
                    else
                    {
                        lblNumOfPeopleError.Text = "Number of people to book in has to be greater than zero, please check your choice";
                    }//End of if else statement that checks if  the number of people to be booked in is greater than zero
                }
                else
                {
                    lblToursError.Text = "Invalid selection from the tours list. Please, tick off 1 tour at least and no more than 3.";
                }// End of if else statement to check tours selection 
            }//End of if is not a postback checking 
            #endregion
        }// End of Page Load ivent handler

        //Event handler for Number of people dropdown list changed
        protected void ddlNumOfPeople_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Clear previous error messages
            this.ClearErrorMsgs();
            //Update total details considering any possible change of currency
            ddlCurrency_SelectedIndexChanged(ddlCurrencyPicker,new EventArgs());
        }// End  of event handler for number of people drop down list changed

        //CheckAvailability button click event handler
        protected void lblCheckAvailability_Click(object sender, EventArgs e)
        {
            //Clear previous error messages
            this.ClearErrorMsgs();
            //Check if one option for tours is selected at least
            if (this.cbxTours.SelectedItem != null && NumberOfToursSelected() < 4)
            {
                //Check if the number of people to be booked in is greater than zero
                if (Convert.ToInt32(this.ddlNumOfPeople.SelectedItem.Text) > 0)
                {
                    if (calDepartureDate.SelectedDate != null && calDepartureDate.SelectedDate > DateTime.Today)
                    {
                        int availability = CheckAvailability();
                        if (availability > Convert.ToInt32(ddlNumOfPeople.SelectedItem.Text))
                        {
                            this.lblDepDateError.Text = string.Format("Number of vacancies:  {0}",availability);
                            this.lblDepDateError.BorderStyle = BorderStyle.Outset;
                            this.lblDepDateError.BorderColor = Color.Green;
                        }
                        else if (availability == 0)
                        {
                            this.lblDepDateError.Text = "Sorry, no vacancies for that data! Try another date.";
                        }
                    }
                    else
                    {
                        //Display error message
                        this.ErrorMsgFormatting(lblDepDateError, "Please, select a valid date for departure date.");
                    }//End of if statement to check selected date is valid date
                }
                else
                {
                    this.ErrorMsgFormatting(lblNumOfPeopleError, "Number of people to book in has to be greater than zero, please check your choice.");
                }//End of if else statement that checks if  the number of people to be booked in is greater than zero
            }
            else { 
                this.ErrorMsgFormatting(lblToursError, "Invalid selection from the tours list. Please, tick off 1 tour at least and no more than 3.");
            }// End of if else statement to check tours selection 
        }// End of check availability button envent handler

        //Event handler for the update total button
        protected void btnUpdateTotal_Click(object sender, EventArgs e)
        {
            //Clear previous error messages
            this.ClearErrorMsgs();
            //Update total details by invoking method to check the curency selected by user and update total details
            ddlCurrency_SelectedIndexChanged(ddlCurrencyPicker,new EventArgs());
        }// End of event handler for update total button

        //Event handler for currency drop down list changed
        protected void ddlCurrency_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Default currency is Euro so currencyFrom name will alwayas be "Euro" for this website
            //Check theere is one currency selected from the drop down menu
            if (this.ddlCurrencyPicker.SelectedItem != null)
            {
                decimal newPrice;
                /*Use the exchange rate to calculate new prices and update data displayes in website
                  Considereing the exchange rate will be zero if an error comes up, it is important to check
                  the retrieved currency exchange rate is not zero, which makes no sense in this context*/
                double exchangeRate = GetExchangeRate();
                if (exchangeRate != 0)
                {
                    //Store the retrieved exchange rate in a view state so it can be used later on
                    //ViewState.Add("exchangeRate", exRate);
                    //this.exchangeRate = exRate;
                    newPrice = Total() * (decimal)exchangeRate;
                    //Check the number of tours is correct
                    if (this.cbxTours.SelectedItem != null && NumberOfToursSelected() < 4)
                    {
                        //Check if the number of people to be booked in is greater than zero
                        if (Convert.ToInt32(this.ddlNumOfPeople.SelectedItem.Text) > 0)
                        {
                            // Update the total price for this booking
                            lblTotal.Text = string.Format("{0:F2}", newPrice);
                            // Update the number of people for this booking
                            lblNumOfPeople.Text = ddlNumOfPeople.SelectedItem.Text;
                            //Divides the total price by the number of people to get unit prices
                            if (Convert.ToDouble(lblNumOfPeople.Text) != 0)
                            {
                                lblPricePP.Text = string.Format("{0:F2}", (newPrice / Convert.ToDecimal(lblNumOfPeople.Text)));
                            }
                            else
                            {
                                lblPricePP.Text = "0";
                            }// End of if else statement to avoid division by zero 
                        }
                        else
                        {
                            this.ErrorMsgFormatting(lblNumOfPeopleError, "Number of people to book in has to be greater than zero, please check your choice.");
                        }// End of if else statement to check the number of people is greater than zero
                    }
                    else
                    {
                        this.ErrorMsgFormatting(lblToursError, "Invalid selection from the tours list. Please, tick off 1 tour at least and no more than 3.");
                    }// End of if else statement to check the number of tours ticked off is valid (1<=Tours<=3)

                }
                else
                {
                    //Show error Message
                    this.ErrorMsgFormatting(lblNumOfPeopleError, "Error retriving currency exchange rate. Price shown in Euro (€).");
                }
            }//End of error checking for exchange rate returned
            else
            {
                this.UpdateTotalBooking();
            }//End of if else statement to check the currency selected by user
        }// End of Event handler for currency drop down list changed

        //Click Event handler for Confirm Booking button
        protected void btnConfirmBooking_Click(object sender, EventArgs e)
        {
            //Clear all previos messages
            ClearErrorMsgs();
            //Error checking for FirstName, Surname and AddressL1 fields are not in blank
            if (this.tbxFName.Text!="" && this.tbxSurname.Text!="" && this.tbxAddress1.Text!="") {
                //Invoke method to check the selected city exists in the selected country
                if (IsCityOK()) {
                    //Check if one option for tours is selected at least
                    if (this.cbxTours.SelectedItem != null && NumberOfToursSelected() < 4)
                    {
                        //Check if the number of people to be booked in is greater than zero
                        if (Convert.ToInt32(this.ddlNumOfPeople.SelectedItem.Text) > 0)
                        {
                            //Check the departure date is valid
                            if (this.calDepartureDate.SelectedDate != null && this.calDepartureDate.SelectedDate >= DateTime.Today)
                            {
                                //Check if payment details are not in blank
                                if (this.tbxCardNumber.Text != "" && this.tbxCardHolder.Text != "" && this.tbxCVV.Text != "")
                                {
                                    if (this.tbxCardNumber.Text.Length == 16 && long.TryParse(this.tbxCardNumber.Text, out noCard))
                                    {
                                        if (this.tbxCVV.Text.Length == 3 && short.TryParse(this.tbxCVV.Text, out noCVV))
                                        {
                                            /*Now that all possible input errors were checked, next step is to call method that checks for availability 
                                              and sends insert query to database*/
                                            //Check for availability
                                            //if there is availability
                                            //Insert new Address in the Address Table
                                            InsertAddress(this.tbxAddress1.Text,this.tbxAddress2.Text,
                                                          Convert.ToInt32(this.ddlCity.SelectedItem.Value));
                                            //Insert Customer in Customers table
                                            InsertCustomer(this.tbxFName.Text.Trim().ToUpper(), this.tbxSurname.Text.Trim().ToUpper(),
                                                                         GetLastIdentity("SELECT MAX(AddressID) AS LastID FROM Address"), this.tbxPhone.Text.Trim(),
                                                                         this.tbxEmail.Text.Trim());
                                            //Insert Payment mehtod in PaymentMethod table
                                            InsertPaymentMethod(this.tbxCardNumber.Text, GetExpDate(), Convert.ToInt32(this.tbxCVV.Text),
                                                                GetLastIdentity("SELECT MAX(CustomerID) AS LastID FROM Customers"));
                                            //Insert new Booking
                                            int currencyID = Convert.ToInt32(this.ddlCurrencyPicker.SelectedItem.Value);
                                            InsertBooking(GetPackageItemID(), Convert.ToInt32(this.ddlNumOfPeople.SelectedItem.Text), this.calDepartureDate.SelectedDate,
                                                          currencyID,GetExchangeRate(), GetLastIdentity("SELECT MAX(CustomerID) AS LastID FROM Customers"),
                                                          GetLastIdentity("SELECT MAX(PaymentID) AS LastID FROM PaymentMethod"));
                                            //Transfer customer to the confirmation form 
                                            Server.Transfer("BookingConfirmation.aspx");

                                        }
                                        else
                                        {
                                            this.ErrorMsgFormatting(lblCVVError, "Invalid secret number, make sure it is a 3 digit number with no letters or characters.");
                                        }//End of if else statement that checks the CVV field is valid
                                    }
                                    else
                                    {
                                        this.ErrorMsgFormatting(lblCardNumError, "Invalid card number, make sure it is a 16 digit number with no letters or characters.");
                                    }//End of if else statement to check card number text box 
                                }
                                else
                                {
                                    this.ErrorMsgFormatting(lblPayDetailsError, "Please check mandatory payment details are not in blank.");
                                }// End of if else statement to check if payment method detials are not in blank
                            }
                            else
                            {
                                this.ErrorMsgFormatting(lblDepDateError, "Please, select a valid date for departure date.");
                            }// End of if else statement that check if a deperture date was selected
                        }
                        else
                        {
                            this.ErrorMsgFormatting(lblNumOfPeopleError, "Number of people to book in has to be greater than zero, please check your choice.");
                        }//End of if else statement that checks if  the number of people to be booked in is greater than zero
                    }
                    else
                    {
                        this.ErrorMsgFormatting(lblToursError, "Invalid selection from the tours list. Please, tick off 1 tour at least and no more than 3.");
                    }// End of if else statement to check tours selection 
                }
                else {
                    this.ErrorMsgFormatting(lblCustDetailsError,"Please, check the city you select is in the selected country.");
                }// End of if else statement to check the city exists in the country selected
            }
            else {
                this.ErrorMsgFormatting(lblCustDetailsError, "Please,make sure mandatory fields for Customer Details are not left in blank.");
            }// End of if else statement for checking the FirstName, Surname and AddressL1 fields are not empty
        }// End of click even handler of book button

        #endregion


        #region HELPER METHODS

        #region CSS FORMATTING METHODS
                //Method used to clear all error messages displayed in the page
        private void ClearErrorMsgs()
        {
            this.lblCustDetailsError.Text = "";
            this.lblToursError.Text = "";
            this.lblNumOfPeopleError.Text = "";
            this.lblDepDateError.Text = "";
            this.lblCardNumError.Text = "";
            this.lblPayDetailsError.Text = "";
            this.lblCVVError.Text = "";
            this.ClearErrorMsgFormatting();
        }// End of ClearErrorMsgs method

        //Method to format error messages by passing in the label to be formated
        private void ErrorMsgFormatting(Label lblError, string text)
        {
            lblError.BorderColor = Color.Red;
            lblError.BorderStyle = BorderStyle.Outset;
            lblError.Font.Size = 14;
            lblError.Text = text;
        }// End of ErrorMsgsFormatting

        //Method to clear CSS fromatting for a specific error label
        private void ClearErrorMsgFormatting(Label lblError)
        {
            lblError.BorderStyle= BorderStyle.None;
        }// End of ClearErrorMsgFormatting acepting a specific label

        //Method to clear  CSS formating for all error labels
        private void ClearErrorMsgFormatting()
        {
            ClearErrorMsgFormatting(lblCustDetailsError);
            ClearErrorMsgFormatting(lblToursError);
            ClearErrorMsgFormatting(lblNumOfPeopleError);
            ClearErrorMsgFormatting(lblDepDateError);
            ClearErrorMsgFormatting(lblCardNumError);
            ClearErrorMsgFormatting(lblCVVError);
            ClearErrorMsgFormatting(lblPayDetailsError);
        }//End of ClearErrorMsgFormatting

        //Method to  clear the total details section before updating with new data
        private void ClearTotalDetails()
        {
            lblTotal.Text = "";
            lblNumOfPeople.Text = "";
            lblPricePP.Text = "";
        }//End of ClearTotalDetails method
        #endregion
        
        //Method to determine the tour selected in the previous page.
        private void ToursSelected(CheckBoxList tours)
        {
            string tourDescription;
            List<string> itemsSelected = new List<string>();
            ListItemCollection list = tours.Items;
            foreach (ListItem item in list)
            {
                if (item.Selected)
                {
                    itemsSelected.Add(item.Value);
                }// End of if statemnt to check if the item was checked
            }// End of foreach statement to go through CheckboxList Items property
             //Now it is necessary to go through the full tours checkbox list and check
             //those items with same value as the items in the itemsSelected list
            foreach (string value in itemsSelected)
            {
                foreach (ListItem item in this.cbxTours.Items){
                    if (item.Value.Equals(value))
                    {
                        item.Selected = true;
                    }// End of if statement 
                }// End of inner foreach statement

            }// End of outer foreach statement

        }// End of method to replicate the tours checked on previous page

        //Method to transform the expiry date selected by user and transform it into a DateTime data type
        private DateTime GetExpDate()
        {
            //Declare and initialize date type to be returned
            DateTime date;
            string stringDate = string.Format("01/{0}/{1}", ddlMonth.SelectedItem.Value, ddlYear.SelectedItem.Text);
            return Convert.ToDateTime(stringDate);
        }// End of GetExpDate method

        //Method to get the ID of last customer inserted in Customers table
        private int GetLastIdentity(string query)
        {
            // A connection object to connect to the database defined by my connection string 
            SqlConnection connenctionObject = new SqlConnection(connectionString);
            // This object sends commands to the database
            SqlCommand commandObject = new SqlCommand();
            int maxID = 0;
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
            catch {
                //Error message
                this.ErrorMsgFormatting(this.lblPayDetailsError,"Error trying to access the database!");
                return maxID;
            }
            finally
            {
                //Close the connection to database
                connenctionObject.Close();
            }
        }// End of GetLastCustomerID method

        private int GetPackageItemID()
        {
            int packageItemID;
            int toursQty = this.NumberOfToursSelected();
            if (toursQty == 1)
            {
                packageItemID = Convert.ToInt32(this.cbxTours.SelectedItem.Value);
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

        #endregion// End of Helper methods region

        private bool IsCityOK()
        {
            bool cityIsInCountry = false;
            switch (this.ddlCountry.SelectedIndex)
            {
                case 0://Ireland
                    switch (ddlCity.SelectedItem.Text)
                    {
                        case "Dublin":
                        case "Sligo":
                        case "Limerick":
                        case "Cork":
                            cityIsInCountry = true;
                            break;
                        default:
                            cityIsInCountry = false;
                            break;
                    }// End of switch stement to check cities in Ireland
                    break;
                case 1://Spain
                    switch (ddlCity.SelectedItem.Text)
                    {
                        case "Madrid":
                        case "Barcelona":
                            cityIsInCountry = true;
                            break;
                        default:
                            cityIsInCountry = false;
                            break;
                    }// End of switch stement to check cities in Spain
                    break;
                case 2:// France
                    switch (ddlCity.SelectedItem.Text)
                    {
                        case "Paris":
                        case "Lyon":
                            cityIsInCountry = true;
                            break;
                        default:
                            cityIsInCountry = false;
                            break;
                    }// End of switch stement to check cities in France
                    break;
                case 3://England
                    switch (ddlCity.SelectedItem.Text)
                    {
                        case "London":
                        case "Liverpool":
                        case "Manchester":
                            cityIsInCountry = true;
                            break;
                        default:
                            cityIsInCountry = false;
                            break;
                    }// End of switch stement to check cities in England
                    break;
                case 4:// United States
                    switch (ddlCity.SelectedItem.Text)
                    {
                        case "New York":
                        case "Chicago":
                        case "Miami":
                            cityIsInCountry = true;
                            break;
                        default:
                            cityIsInCountry = false;
                            break;
                    }// End of switch stement to check cities in Spain
                    break;
                case 5://Venezuela
                    switch (ddlCity.SelectedItem.Text)
                    {
                        case "Caracas":
                        case "Valencia":
                            cityIsInCountry = true;
                            break;
                        default:
                            cityIsInCountry = false;
                            break;
                    }// End of switch stement to check cities in Spain
                    break;
                default:
                    cityIsInCountry = false;
                    break;
            }// End of switch statemnt 
            return cityIsInCountry;
        }

        #region TOTAL CALCULATION METHODS
        //Helper method to query the database and get the price for the package selected by customer
        // Selecting only one tour, the single price will apply, but selecting 2 or 3 tours package prices are applied
        private decimal SelectPrice(int packageID)
        {
            //Declare and initialize a decimal variable to return the price
            decimal price = 0m;
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
                commandObject.CommandText = string.Format("SELECT PackageItemID,Price FROM PackageItems WHERE PackageItemID = {0}", packageID);
                SqlDataReader priceRetrieved = commandObject.ExecuteReader();
                if (priceRetrieved.Read())
                {
                    price = Convert.ToDecimal(priceRetrieved["Price"].ToString());
                }
                return price;
            }
            catch {
                this.ErrorMsgFormatting(lblPayDetailsError,"Error while retrieving tour prices. Operation unsuccessful!");
                return price;
            }
            finally { 
                //Close the database connection object
            connenctionObject.Close();
            }
           
            
        }// End of DefineToursPrice method

        //Method to determine price of package
        private decimal GetPackagePrice(List<string> TourIDList, int toursQty)
        {
            decimal price = 0m;
            //Based on the number of tours selected and the value of each item, it is possible to find
            // the price in the PackageItems table in Travel_Agent_DB.
            if (toursQty == 1)
            {
                price = SelectPrice(Convert.ToInt32(TourIDList.First()));
            }
            else if (toursQty == 2 || toursQty == 3)
            {
                int i = 0;
                bool IsShortTour = false;
                while (i < TourIDList.Count && !IsShortTour)
                {
                    //Check if the tourID corresponds to a long tour as double and triple packages can only be made off 9 day tours (All long tourID for long tours are even numbers!) 
                    if (Convert.ToInt32(TourIDList.ElementAt(i)) % 2 != 0)
                    {
                        IsShortTour = true;
                    }// End of if statement that checks the tourID corresponds to a 9 day tour
                    i++; // Move to next item in list
                }// End of while loop to check tours ticked off are 9 day tours

                //Check the reason why the loop was finished
                if (i == TourIDList.Count && !IsShortTour)
                {   //if the tours in the list are considered as long tours:
                    //Invoke method to get price from database. Depending on the number of packages that were ticked off the price will vary
                    if (toursQty == 2)
                    {
                        price = SelectPrice(11);
                    }
                    else if (toursQty == 3)
                    {
                        price = SelectPrice(12);
                    }
                }
                else
                {
                    //Show error message
                    this.ErrorMsgFormatting(lblToursError, "Invalid selection of tours. For double and triple tour packages only 9 day tours are accepted!");
                } // End of if else statement to check if tour selection is valid for 3 day packages
            }
            else
            {
                //Show error message
                this.ErrorMsgFormatting(lblToursError, "Invalid selection from the tours list. Please, tick off 1 tour at least and no more than 3.");
            }// End of nested if else statements to check the number of packages ticked off
            return price;
        }// End of GetPackagePrice method

        //Method to calculate the total of the current booking
        private decimal Total()
        {
            try
            {
                //variable to store the total amount due
                decimal total = 0m;
                //List of tours selected by user
                List<string> toursTickedOff = new List<string>();
                //Variable to store package price
                decimal packagePrice = 0;
                //Total Number of tours selected (Should be a number between 1 and 3, both inclusive)
                int toursQty = NumberOfToursSelected();
                //Go through the list of tours and confirm the selected items and add them to toursTickedOff list
                foreach (ListItem item in cbxTours.Items)
                {
                    if (item.Selected)
                    {
                        toursTickedOff.Add(item.Value);
                    }// End of if statemnt to check if the item was checked
                }// End of foreach statement to go through CheckboxList Items property

                //Call method that gets price for package selected by user
                packagePrice = GetPackagePrice(toursTickedOff, toursQty);
                //Calculate total by multipliying unit price of package by the number of people to book in
                total = packagePrice * Convert.ToInt32(this.ddlNumOfPeople.SelectedItem.Text);
                return total;
            }
            catch { return 0; }
            finally { }
        }// End of Total method

        //Method to calculate the excahnge rate of a currency vs th Euro
        private double GetExchangeRate() {
            //Default currency is Euro so currencyFrom name will alwayas be "Euro" for this website
            //Check theere is one currency selected from the drop down menu
            if (this.ddlCurrencyPicker.SelectedItem != null)
            {
                // Create new ServiceClient object to get access to serice methods
                Service1Client ExchangeRateClient = new Service1Client();
                //Define the name of the currency based on the Value stored in the ListItem object.
                string currencyTo;
                double exchangeRate;
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
             else {
                 return 0;
            }// End of if statement to check a valid currency is selected
        }// End of GetExchangeRate method

        //Method to update Total booking details 
        private void UpdateTotalBooking()
        {
            //Clear Previous Total details
            ClearTotalDetails();
            //Check the number of tours is correct
            if (this.cbxTours.SelectedItem != null && NumberOfToursSelected() < 4)
            {
                //Check if the number of people to be booked in is greater than zero
                if (Convert.ToInt32(this.ddlNumOfPeople.SelectedItem.Text) > 0)
                {
                    // Update the total price for this booking
                    decimal total = Total();
                    lblTotal.Text = string.Format("{0:F2}",total);
                    // Update the number of people for this booking
                    lblNumOfPeople.Text = ddlNumOfPeople.SelectedItem.Text;
                    //Divides the total price by the number of people to get unit prices
                    if (Convert.ToDouble(lblNumOfPeople.Text) != 0)
                    {
                        lblPricePP.Text = string.Format("{0:F2}", (total / Convert.ToDecimal(lblNumOfPeople.Text)));
                    }
                    else
                    {
                        lblPricePP.Text = "0";
                    }// End of if else statement to avoid division by zero 
                }
                else
                {
                    this.ErrorMsgFormatting(lblNumOfPeopleError, "Number of people to book in has to be greater than zero, please check your choice.");
                }// End of if else statement to check the number of people is greater than zero
            }
            else
            {
                this.ErrorMsgFormatting(lblToursError, "Invalid selection from the tours list. Please, tick off 1 tour at least and no more than 3.");
            }// End of if else statement to check the number of tours ticked off is valid (1<=Tours<=3)


        }// End of UpdateTotalBooking

        //Check the number of items ticked off for list of tours (cbxTours)
        private int NumberOfToursSelected()
        {
            //Declare and Initialize counter
            int counter = 0;
            //foreach loop to go through the whole list of items 
            foreach (ListItem tour in cbxTours.Items)
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

        #endregion

        #region DATABASE INSERTION METHODS
        //Method to insert a new Address
        private void InsertAddress(string line1, string line2, int cityID) {
            // A connection object to connect to the database defined by my connection string 
            SqlConnection connenctionObject = new SqlConnection(connectionString);
            // This object sends commands to the database
            SqlCommand commandObject = new SqlCommand();
            try
            {
                //Open the database connection
                connenctionObject.Open();
                //Link the command object with the conneciton object
                commandObject.Connection = connenctionObject;

                //Invoking a stored procedure to insert a booking
                commandObject.CommandText = "spInsertAddress";
                commandObject.CommandType = CommandType.StoredProcedure;
                commandObject.Parameters.Add(new SqlParameter("@Line1", line1));
                commandObject.Parameters.Add(new SqlParameter("@Line2", line2));
                commandObject.Parameters.Add(new SqlParameter("@CityID", cityID));

                //Run the stored procedure to insert the customer 
                commandObject.ExecuteNonQuery();
            }// End of try block

            catch
            {
                //Error message!
                this.ErrorMsgFormatting(lblPayDetailsError, "Error while registering Address data into database. Operation not completed!");
            }

            finally
            {
                //Close the connection to database 
                connenctionObject.Close();
            }
        }// End of InsertAddress method

        //Method to insert a Customer
        private void InsertCustomer(string firstName, string surName, int addressID, string phone, string email)
        {
            // A connection object to connect to the database defined by my connection string 
            SqlConnection connenctionObject = new SqlConnection(connectionString);
            // This object sends commands to the database
            SqlCommand commandObject = new SqlCommand();
            try
            {
                //Open the database connection
                connenctionObject.Open();
                //Link the command object with the conneciton object
                commandObject.Connection = connenctionObject;

                //Invoking a stored procedure to insert a booking
                commandObject.CommandText = "spInsertCustomer";
                commandObject.CommandType = CommandType.StoredProcedure;
                commandObject.Parameters.Add(new SqlParameter("@FName", firstName));
                commandObject.Parameters.Add(new SqlParameter("@SName", surName));
                commandObject.Parameters.Add(new SqlParameter("@AddressID", addressID));
                commandObject.Parameters.Add(new SqlParameter("@phone", phone));
                commandObject.Parameters.Add(new SqlParameter("@email", email));

                //Run the stored procedure to insert the customer 
                commandObject.ExecuteNonQuery();
            }// End of try block

            catch {
                //Error message
                this.ErrorMsgFormatting(lblPayDetailsError, "Error while registering Customer data into database. Operation not completed!");
            }
  
            finally {
                //Close the connection to database 
                connenctionObject.Close();
            }  
        }//End of InserCustomer method

        //Method to inset a new PaymentMethod
        private void InsertPaymentMethod(string cardNumber, DateTime date, int CVV, int customerID)
        {
            // A connection object to connect to the database defined by my connection string 
            SqlConnection connenctionObject = new SqlConnection(connectionString);
            // This object sends commands to the database
            SqlCommand commandObject = new SqlCommand();

            try
            {
                //Open the database connection
                connenctionObject.Open();
                //Link the command object with the conneciton object
                commandObject.Connection = connenctionObject;
                //Invoking a stored procedure to insert a payment method
                commandObject.CommandText = "spInsertPaymentMethod";
                commandObject.CommandType = CommandType.StoredProcedure;
                commandObject.Parameters.Add(new SqlParameter("@CardNumb", cardNumber));
                commandObject.Parameters.Add(new SqlParameter("@Date", date));
                commandObject.Parameters.Add(new SqlParameter("@SecretCode", CVV));
                commandObject.Parameters.Add(new SqlParameter("@CustomerID", customerID));

                //Execute the query
                commandObject.ExecuteNonQuery();
            }// End of try block

            catch {
                //Error message
                this.ErrorMsgFormatting(lblPayDetailsError, "Error while registering payment method data into data base. Operation not completed!");
            }// End of catch block
            finally
            { //Close the connection to database
                connenctionObject.Close();
            }
        }//End of InsertPaymentMethod method

        //Method to insert a booking. Precondition is all error checking is done before invoking this method
        private void InsertBooking(int packageItemID, int numPeople, DateTime date, int currencyID,double exchangeRate, int customerID, int paymentID)
        {
            // A connection object to connect to the database defined by my connection string 
            SqlConnection connenctionObject = new SqlConnection(connectionString);
            // This object sends commands to the database
            SqlCommand commandObject = new SqlCommand();
            try {
                //Open the database connection
                connenctionObject.Open();
                //Link the command object with the conneciton object
                commandObject.Connection = connenctionObject;

                //Invoking a stored procedure to insert a booking
                commandObject.CommandText = "spInsertBooking";
                commandObject.CommandType = CommandType.StoredProcedure;
                commandObject.Parameters.Add(new SqlParameter("@PackageItemID", packageItemID));
                commandObject.Parameters.Add(new SqlParameter("@NumOfPeople", numPeople));
                commandObject.Parameters.Add(new SqlParameter("@Departure", date));
                commandObject.Parameters.Add(new SqlParameter("@CurrencyID", currencyID));
                commandObject.Parameters.Add(new SqlParameter("@ExchangeRate", exchangeRate));
                commandObject.Parameters.Add(new SqlParameter("@CustomerID", customerID));
                commandObject.Parameters.Add(new SqlParameter("@PaymentID", paymentID));

                // Use the method to send the command to the database
                commandObject.ExecuteNonQuery();
            }//End of try block
            catch {
                //Error message
                this.ErrorMsgFormatting(lblPayDetailsError, "Error while registering booking data into data base. Operation not completed!");
            }
            finally {
                //Close the connection to database
                connenctionObject.Close();
            }// End of finally block
      
        }//End of InsertBooking method

        #endregion// End of data Insert methods

        //Method to check availability based on tours selected by the user
        private int CheckAvailability()
        {
            int places = 0;
            DateTime departureDate = this.calDepartureDate.SelectedDate;
            int length;
            switch (this.NumberOfToursSelected())
            {
                case 1:
                    //Define the length of the tour. For tours with ID between 1 to 10: Odd ToursID are 5 day long and even toursID are 9 day long
                    if (Convert.ToInt32(this.cbxTours.SelectedItem.Value) % 2 != 0)
                    {
                        length = 5;
                    }
                    else
                    {
                        length = 9;
                    }
                    //Invoke sp to count number of reservations between departure date and leave date
                    places =  GetCapacity(Convert.ToInt32(this.cbxTours.SelectedItem.Value)) - GetReservations(departureDate, length);
                    break;
                case 2:
                case 3:
                    this.ErrorMsgFormatting(this.lblDepDateError, "To check availability for double and triple tour packages, please contact the Travel Agent directly. Apologies!");
                    places = -1;        
                    break;
                default:
                    places = 0;
                    break;
            }// End of switch statement
            return places;
        }// End of CheckAvailability method

        private int GetReservations(DateTime departureDate, int length)
        {
            // A connection object to connect to the database defined by my connection string 
            SqlConnection connenctionObject = new SqlConnection(connectionString);
            // This object sends commands to the database
            SqlCommand cmd = new SqlCommand();
            int reservations = 0;
            try
            {
                //Open the database connection
                connenctionObject.Open();
                //Link the command object with the conneciton object
                cmd.Connection = connenctionObject;
                //Set query text 
                cmd.CommandText = "spGetReservations";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Departure",departureDate);
                cmd.Parameters.AddWithValue("@Length", length);
                SqlDataReader numberOFReservations = cmd.ExecuteReader();
                if (numberOFReservations.Read())
                {
                    reservations = (int)numberOFReservations["PlacesReserved"];
                }

                return reservations;

            }//End of GetLastCustomerID method
            catch
            {
                //Error message
                this.ErrorMsgFormatting(this.lblDepDateError, "Error trying to calculate number of free places!");
                return reservations;
            }
            finally
            {
                //Close the connection to database
                connenctionObject.Close();
            }
        }// End of GetREservations method

        private int GetCapacity(int tourID) {
            
            // A connection object to connect to the database defined by my connection string 
            SqlConnection connenctionObject = new SqlConnection(connectionString);
            // This object sends commands to the database
            SqlCommand cmd = new SqlCommand();
            int capacity = 0;
            try
            {
                //Open the database connection
                connenctionObject.Open();
                //Link the command object with the conneciton object
                cmd.Connection = connenctionObject;
                //Set query text 
                cmd.CommandText = "spGetCapacity";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TourID",tourID);
                SqlDataReader totalCapacity = cmd.ExecuteReader();
                if (totalCapacity.Read())
                {
                    capacity = (int)totalCapacity["PlacesReserved"];
                }
                return capacity;
            }//End of GetLastCustomerID method
            catch
            {
                //Error message
                this.ErrorMsgFormatting(this.lblPayDetailsError, "Error trying to calculate number of free places!");
                return capacity;
            }
            finally
            {
                //Close the connection to database
                connenctionObject.Close();
            }
        }// End of GetCapacity method


    }// End of class
}// End of namespace