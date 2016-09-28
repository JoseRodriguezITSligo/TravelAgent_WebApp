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
    public partial class WebForm12 : System.Web.UI.Page
    {
        //Declaring a static connection string to create the connection object to communicate with database
        static string connectionString = "Data Source=MILLENIUMHAWCK\\HDIP;Initial Catalog=Travel_Agent_DB;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        #region EVENT HANDLRES
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Method to submit query to database
        protected void btnSubmitMessage_Click(object sender, EventArgs e)
        {
            //Check the mandatory fields have been selected
            if (this.ddlTypeOfMsg.SelectedItem!=null) {
                if (this.tbxFirstName.Text != "")
                {
                    if (this.tbxSurname.Text != "")
                    {
                        if (this.tbxEmail.Text != "")
                        {
                            if (this.tbxContactText.Text != "")
                            {
                                //Send message record to database
                                this.InsertMessage(Convert.ToInt32(ddlTypeOfMsg.SelectedItem.Value), tbxFirstName.Text,
                                                   tbxSurname.Text, tbxPhone.Text, tbxEmail.Text, tbxContactText.Text, DateTime.Today);
                                this.ClearLabel(lblErrorMessage);
                                this.lblConfirmation.BorderStyle = BorderStyle.Outset;
                                this.lblConfirmation.BorderColor = Color.Blue;
                                this.lblConfirmation.Font.Size = 14;
                                this.lblConfirmation.Text = "Your message has been successfully sent. We will contact you as soon as possible. Thanks";
                                this.ClearForm();
                            }
                            else
                            {
                                this.ErrorMsgFormatting(lblErrorMessage, "message");
                            }// End of if statement to check text message is not null
                        }
                        else
                        {
                            this.ErrorMsgFormatting(lblErrorMessage, "email address");
                        }// End of if statement to check the email field is not null
                    }
                    else
                    {
                        this.ErrorMsgFormatting(lblErrorMessage, "surname");
                    }// End of if statement to check surname field is not null
                }
                else {
                    this.ErrorMsgFormatting(lblErrorMessage, "first name");
                }// End of if statement to check name field is not empty
            }// End of if statement to check drop down list selection is not null
        }// End of click event handler of submit message button
        #endregion

        #region HELPER METHODS
        private void InsertMessage(int type,string fName, string surname, string phone, string email,string textMessage, DateTime creationDate) {
            // A connection object to connect to the database defined by my connection string 
            SqlConnection connenctionObject = new SqlConnection(connectionString);
            // This object sends commands to the database
            SqlCommand commandObject = new SqlCommand();
            int customerID = 0;
            try
            {
                //Open the database connection
                connenctionObject.Open();
                //Link the command object with the conneciton object
                commandObject.Connection = connenctionObject;

                //Invoking a stored procedure to insert a booking
                commandObject.CommandText = "spInsertMessage";
                commandObject.CommandType = CommandType.StoredProcedure;
                commandObject.Parameters.Add(new SqlParameter("@Type", type));
                commandObject.Parameters.Add(new SqlParameter("@FName", fName));
                commandObject.Parameters.Add(new SqlParameter("@Surname", surname));
                commandObject.Parameters.Add(new SqlParameter("@Phone", phone));
                commandObject.Parameters.Add(new SqlParameter("@Email", email));
                commandObject.Parameters.Add(new SqlParameter("@TextMessage", textMessage));
                commandObject.Parameters.Add(new SqlParameter("@CreationDate", creationDate));

                //Run the stored procedure to insert the customer 
                commandObject.ExecuteNonQuery();
            }// End of try block

            catch
            {
                //Code some error message!
            }

            finally
            {
                //Close the connection to database 
                connenctionObject.Close();
            }
        }//End of InserCustomer method

        //Method to clear Confirmation message
        private void ClearLabel(Label label) {
            label.BorderStyle = BorderStyle.None;
            label.Text = "";
        }//End of clearCpnfrmation method

        //Method to format error messages by passing in the label to be formated
        private void ErrorMsgFormatting(Label lblError, string text)
        {
            this.ClearLabel(lblConfirmation);
            lblError.BorderColor = Color.Red;
            lblError.BorderStyle = BorderStyle.Outset;
            lblError.Font.Size = 14;
            lblError.ForeColor = Color.Blue;
            lblError.Text = string.Format("Please, make sure your {0} is not left blank!",text);
        }// End of ErrorMsgsFormatting

        //Method to clear all data input bu user after message is successfully submitted
        private void ClearForm() {
            this.tbxFirstName.Text = "";
            this.tbxSurname.Text = "";
            this.tbxPhone.Text = "";
            this.tbxEmail.Text = "";
            this.tbxContactText.Text = "";
            this.ddlTypeOfMsg.ClearSelection();
        }//End of ClearForm method
        #endregion
    }// End of class
}// End of namespace