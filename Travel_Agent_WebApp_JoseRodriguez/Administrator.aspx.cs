using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Travel_Agent_WebApp_JoseRodriguez
{
    public partial class WebForm15 : System.Web.UI.Page
    {
        //Declaring a static connection string to create the connection object to communicate with database
        static string connectionString = "Data Source=MILLENIUMHAWCK\\HDIP;Initial Catalog=Travel_Agent_DB;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        //Event handler for update price method
        protected void btnUpdatePrice_Click(object sender, EventArgs e)
        {
            this.ClearMessages();
            decimal newPrice;
            if (this.rdBtnTours.SelectedItem != null)
            {
                //Get the new price and confirm is number
                if (decimal.TryParse(this.tbxNewPrice.Text, out newPrice))
                {
                    //Invoke method to call stored procedure to update the tour with the selected ID

                    if (UpdatePackagePrice(Convert.ToInt32(this.rdBtnTours.SelectedItem.Value), newPrice)) {
                        this.ErrorMsgFormatting(lblUpdatePriceResult, "Price has been updated");
                        this.lblUpdatePriceResult.BorderColor = Color.Green;
                    }
                    else {
                        this.ErrorMsgFormatting(lblUpdatePriceResult, "Error conectiong the databse, update failed!");
                    }
                }
                else
                {
                    //Error message!
                    this.ErrorMsgFormatting(lblUpdatePriceResult, "Only numeric values are accepted!");
                }
            }
            else {
                this.ErrorMsgFormatting(this.lblUpdatePriceResult, "Please select one tour!");
            }

        }// End of event handler

        protected void btnUpdateCapacity_Click(object sender, EventArgs e)
        {
            this.ClearMessages();
            int newCapacity;
            if (this.rdBtnDestinations.SelectedItem != null)
            {
                //Get the new price and confirm is number
                if (int.TryParse(this.tbxNewCapacity.Text, out newCapacity))
                {
                    //Invoke method to call stored procedure to update the tour with the selected ID

                    if (UpdateDestCapacity(Convert.ToInt32(this.rdBtnDestinations.SelectedItem.Value), newCapacity))
                    {
                        this.ErrorMsgFormatting(lblUpdateCapResult, "Capacity has been updated");
                        this.lblUpdateCapResult.BorderColor = Color.Green;
                    }
                    else
                    {
                        this.ErrorMsgFormatting(lblUpdateCapResult, "Error conectiong the databse, update failed!");
                    }
                }
                else
                {
                    //Error message!
                    this.ErrorMsgFormatting(lblUpdateCapResult, "Only numeric values are accepted!");
                }
            }
            else
            {
                this.ErrorMsgFormatting(this.lblUpdateCapResult, "Please select one tour!");
            }
        }// End of UpdateDestCapacity method
        #region HELPER METHOD
        private bool UpdatePackagePrice(int packageItemID, decimal newPrice) {
            bool result=false;
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

                //Invoking a stored procedure to insert a booking
                cmd.CommandText = "spUpdatePackagePrice";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PackageItemID", packageItemID);
                cmd.Parameters.AddWithValue("@NewPrice", newPrice);
                //Run the stored procedure to insert the customer 
                cmd.ExecuteNonQuery();
                return result = true;
            }// End of try block

            catch
            {
                return result = false;
            }

            finally
            {
                //Close the connection to database 
                connenctionObject.Close();
            }
        }// End of UpdatePackagePrice

        private bool UpdateDestCapacity(int packageItemID, decimal newCapacity) {
             bool result=false;
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

                //Invoking a stored procedure to insert a booking
                cmd.CommandText = "spUpdateDestCapacity";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DestinationID", packageItemID);
                cmd.Parameters.AddWithValue("@NewCapacity ", newCapacity);
                //Run the stored procedure to insert the customer 
                cmd.ExecuteNonQuery();
                return result = true;
            }// End of try block

            catch
            {
                return result = false;
            }

            finally
            {
                //Close the connection to database 
                connenctionObject.Close();
            }
        }


        private void ErrorMsgFormatting(Label lblError, string text)
        {
            lblError.BorderColor = Color.Red;
            lblError.BorderStyle = BorderStyle.Outset;
            lblError.Font.Size = 14;
            lblError.Text = text;
        }// End of ErrorMsgsFormatting

        private void ClearMessages() {
            this.lblUpdateCapResult.Text = "";
            this.lblUpdateCapResult.BorderStyle = BorderStyle.None;
            this.lblUpdatePriceResult.Text = "";
            this.lblUpdatePriceResult.BorderStyle = BorderStyle.None;
        }
        #endregion

    }// End of class
}