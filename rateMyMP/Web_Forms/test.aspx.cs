using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_Forms_test : System.Web.UI.Page
{
    userMasterBO userMasterBO = new userMasterBO();
    userMasterBAL userMasterBAL = new userMasterBAL();
    
    protected void Page_Load(object sender, EventArgs e)
    {

        string ss = "";
        string fname = "";
        string lname = "";

        if (!Page.IsPostBack) //if page is not postbacked then  page.ispostback return false.
        {
            if (Request.UrlReferrer != null)
            {
                ss = Request.UrlReferrer.AbsoluteUri.ToString();
                ss = ss.Substring(ss.LastIndexOf("/") + 1);
                if (ss == "Home.aspx")
                {
                    if (Session["userEmail"] == null)
                    {   //creat the session for user

                        Session["userEmail"] = Request["email"].ToString();
                        if (Request["social"].ToString() == "yes")
                        {
                            Session["userName"] = Request["name"].ToString();
                            Session["socialType"] = Request["socialType"].ToString();  //google or facebook
                            Session["socialOrNot"] = 1; // 1 for login through social network 0 for local login
                            string tnameval = Session["userName"].ToString();
                            string[] tnamearray = tnameval.Split(' ');
                            fname = tnamearray[0];
                            if (tnamearray.Length > 1)
                            {
                                lname = tnamearray[1];
                            }
                            else
                            {
                                lname = "";
                            }


                        }
                        else//for custom login
                        {
                            //here we will add first name and last name and put into username.
                            string tname = "";
                            fname = Request["fname"].ToString();
                            lname = Request["lname"].ToString();
                            Session["userName"] = tname;
                            Session["socialType"] = "local";
                            Session["socialOrNot"] = 0; //HERE 0 MEANS LOCAL USER.

                        }

                        //give the code to insert data into the usermaster table.


                        userMasterBO.email = Session["userEmail"].ToString();
                        userMasterBO.lastName = lname;
                        userMasterBO.firstName = fname;
                        userMasterBO.password = "";
                        if (int.Parse(Session["socialOrNot"].ToString()) == 1)
                        {
                            userMasterBO.socialNetwork = true;
                        }
                        else
                        {
                            userMasterBO.socialNetwork = false;
                        }

                        userMasterBO.roleId = 3; //3 for user , 2 for mp,1 for admin, 4  for moderator
                        userMasterBO.snTypeId = 1;




                    }
                    else// if session is not null
                    {
                        //do code
                    }

                }
                else //every this is already done(session and storing of data in database is already done)
                {

                }
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }
    
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "myfunction", "logout()", true);
    }
}