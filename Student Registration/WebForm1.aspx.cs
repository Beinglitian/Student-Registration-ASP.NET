using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace Student_Registration
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=DESKTOP-TRLERPQ; initial catalog=Student_Registration; User ID=sa; Password=asdzxc@987; ");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindGridview();
            }
        }

        private void bindGridview()
        {
            {
                DataTable dt = new DataTable();
                SqlConnection con = new SqlConnection(connection);
                SqlDataAdapter adapt = new SqlDataAdapter("Select* from students", con);
                con.Open();
                adapt.Fill(dt);
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    gridview.DataSource = dt;
                    gridview.DataBind();

                }
            }
        }

        string connection = "data source=DESKTOP-TRLERPQ; initial catalog=Student_Registration; User ID=sa; Password=asdzxc@987;";




        protected void btn_sub_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("data source=DESKTOP-TRLERPQ; initial catalog=Student_Registration; User ID=sa; Password=asdzxc@987; ");
            string path = Server.MapPath("~/image/");
            string filename = string.Empty;
            if (photo.HasFile)
            {
                filename = DateTime.Now.ToString("ddMMyyyyHHmmsssfff") + photo.FileName;
                photo.SaveAs(path + filename);
            }

            string path1 = Server.MapPath("~/thumbh_image/");
            string filename1 = string.Empty;
            if (thumbh.HasFile)
            {
                filename1 = DateTime.Now.ToString("ddMMyyyyHHmmsssfff") + thumbh.FileName;
                thumbh.SaveAs(path1 + filename1);
            }
            //else
            //{
            //    Label1.Text = "Select image first !!";
            //}

            SqlCommand cmd = new SqlCommand("insert into students( roll,name,gender,father,course,address, mobile,photo,thumbh ) values('" + txt_rollno.Text + "','" + txt_studentname.Text + "','" + rdo_gender.SelectedValue + "','" + fathername.Text + "','" + ddl_Courses.SelectedValue + "','" + address.Text + "','" + mobile.Text + "','" + filename + "','" + filename1 + "')", con);



            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            ClearSection();
            bindGridview();

        }

        private void ClearSection()
        {
            txt_rollno.Text = "";
            txt_studentname.Text = "";
            rdo_gender.SelectedValue = "Male";
            fathername.Text = "";
            ddl_Courses.SelectedValue = " ";
            address.Text = "";
            mobile.Text = "";

        }





        protected void LinkBtndelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string yourValue = btn.CommandArgument;
            int id = Convert.ToInt32(yourValue);
           
            SqlCommand cmd = new SqlCommand("Delete students where id='" + id + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            bindGridview();
            con.Close();

            
        }

    

    protected void gridview_RowCancelingEdit1(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview
        gridview.EditIndex = -1;
        bindGridview();
    }

    protected void gridview_RowEditing1(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        //NewEditIndex property used to determine the index of the row being edited.
        gridview.EditIndex = e.NewEditIndex;
        bindGridview();
    }

    protected void gridview_RowUpdating1(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {

        TextBox id = gridview.Rows[e.RowIndex].FindControl("txt_id") as TextBox; 
        
        TextBox roll = gridview.Rows[e.RowIndex].FindControl("txt_roll") as TextBox;
        TextBox name = gridview.Rows[e.RowIndex].FindControl("txt_student_name") as TextBox;
        RadioButtonList gender = gridview.Rows[e.RowIndex].FindControl("rdo_gender") as RadioButtonList;
        TextBox father = gridview.Rows[e.RowIndex].FindControl("txt_father_name") as TextBox;
        DropDownList course = gridview.Rows[e.RowIndex].FindControl("ddl_Courses") as DropDownList;
        TextBox address = gridview.Rows[e.RowIndex].FindControl("txt_address") as TextBox;
        TextBox mobile = gridview.Rows[e.RowIndex].FindControl("txt_mobile") as TextBox;
        
        
        //updating the record
        SqlCommand cmd = new SqlCommand("Update students  set roll='" + roll.Text + "', name='" + name.Text + "',gender='" + gender.SelectedValue + "',  father='" + father.Text + "', course='" + course.SelectedValue + "',  address='" + address.Text + "', mobile='" + mobile.Text + "' where id=" + Convert.ToInt32(id.Text), con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview
        gridview.EditIndex = -1;
        //Call bindGridview method for displaying updated data
        bindGridview();
    }
       
    
}

        

}

