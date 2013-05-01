﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Collections.ObjectModel;

namespace TankControl.View
{
    /// <summary>
    /// Interaction logic for User.xaml
    /// </summary>
    public partial class User : UserControl
    {
        private ObservableCollection<TankControl.User> userlist;
        private List<AuthenticationList> authenticationlist;

        public User()
        {
            InitializeComponent();
            authenticationlist = new List<AuthenticationList>()
            {
                new AuthenticationList(){AuthenticationLevel = 1, AuthenticationName = "Administrator"},
                new AuthenticationList(){AuthenticationLevel = 2, AuthenticationName = "Operator"}
            };
            Telerik.Windows.Controls.GridViewComboBoxColumn column = new Telerik.Windows.Controls.GridViewComboBoxColumn();
            this.userListGridView.Columns.Add(column);
            ((Telerik.Windows.Controls.GridViewComboBoxColumn)this.userListGridView.Columns["AuthLevel"]).ItemsSource = authenticationlist;
            
            userlist = new ObservableCollection<TankControl.User>();
                using (TankControlEntities tce = new TankControlEntities())
                {
                    try{
                        var query = from a in tce.Users
                                    select a;
                        foreach (var user in query)
                        {
                            userlist.Add(new TankControl.User()
                            {
                                id = user.id,
                                name = user.name,
                                auth_level = user.auth_level,
                                username = user.username
                            });
                        }
                    }
                    catch (System.Data.EntityException ex)
                    {
                        //MessageBox.Show(ex.InnerException.Message.ToString());
                        MessageBox.Show("An error occured while retrieving data from database. Please contact technician");
                        Application.Current.Shutdown();
                    }
                    catch (Exception ex)
                    {
                        //MessageBox.Show(ex.InnerException.Message.ToString());
                        MessageBox.Show("An unknown error has occurred. Please contact technician");
                        Application.Current.Shutdown();
                    }

                    userListGridView.ItemsSource = userlist;
                }
            
            
        }

        private void userListGridView_RowEditEnded(object sender, Telerik.Windows.Controls.GridViewRowEditEndedEventArgs e)
        {
            var updatedRow = (e.NewData as TankControl.User);
            string error = "";
            if (e.EditAction == Telerik.Windows.Controls.GridView.GridViewEditAction.Cancel)
            {
                ///*action when the user canceled editing or adding item, based on its index*/
                this.userListGridView.Columns[0].IsVisible = true; //show delete button
                this.userListGridView.Columns[1].IsVisible = false; //hide done button
                this.userListGridView.Columns[2].IsVisible = false; //hide cancel button

                errorText.Content = "";
                return;
            }
            if (e.EditOperationType == Telerik.Windows.Controls.GridView.GridViewEditOperationType.Edit)
            {
                using (TankControlEntities tce = new TankControlEntities())
                {
                    try
                    {
                        var toUpdate = (from a in tce.Users
                                        where a.id == updatedRow.id
                                        select a).First();
                        toUpdate.name = updatedRow.name;
                        toUpdate.auth_level = updatedRow.auth_level;
                        toUpdate.username = updatedRow.username;
                        tce.SaveChanges();
                        errorText.Content = "";
                    }
                    catch (System.Data.EntityException ex)
                    {
                        //MessageBox.Show(ex.InnerException.Message.ToString());
                        MessageBox.Show("An error occured while performing update to the database. Please contact technician");
                        Application.Current.Shutdown();
                    }
                    catch (Exception ex)
                    {
                        //MessageBox.Show(ex.InnerException.Message.ToString());
                        MessageBox.Show("An unknown error has occurred. Please contact technician");
                        Application.Current.Shutdown();
                    }
                }
            }
            if (e.EditOperationType == Telerik.Windows.Controls.GridView.GridViewEditOperationType.Insert)
            {
                
                using (TankControlEntities tce = new TankControlEntities())
                {
                    
                    try
                    {
                        tce.Users.Add(updatedRow);
                        tce.SaveChanges();
                        errorText.Content = "";
                    }
                    catch (System.Data.EntityException ex)
                    {
                        //MessageBox.Show(ex.InnerException.Message.ToString());
                        MessageBox.Show("An error occured while performing insert to the database. Please contact technician");
                        Application.Current.Shutdown();
                    }
                    catch (Exception ex)
                    {
                        if (ex.InnerException.InnerException.Message.Contains("UNIQUE"))
                        {
                            error = "Username sudah diambil";
                            SystemError errorMessage = new SystemError();
                            errorMessage.errorLevel = 1;
                            errorMessage.errorDesc = error;
                            tce.SystemErrors.Add(errorMessage);
                            Application.Current.Shutdown();
                        }
                        else
                        {
                            MessageBox.Show("An unknown error has occurred. Please contact technician");
                            Application.Current.Shutdown();
                        }
                    }

                    
                }
            }

            ///*action when the user has finished editing or adding item, based on its index*/
            this.userListGridView.Columns[0].IsVisible = true; //show delete button
            this.userListGridView.Columns[1].IsVisible = false; //hide done button
            this.userListGridView.Columns[2].IsVisible = false; //hide cancel button
        }

        private void userListGridView_Deleted(object sender, Telerik.Windows.Controls.GridViewDeletedEventArgs e)
        {
            var deleted = (e.Items.First() as TankControl.User);
            using (TankControlEntities tce = new TankControlEntities())
            {
                try
                {
                    var query = (from a in tce.Users
                                 where a.id == deleted.id
                                 select a).First();

                    tce.Entry(query).State = System.Data.EntityState.Deleted;
                    tce.SaveChanges();
                    errorText.Content = "";
                }
                catch (System.Data.EntityException ex)
                {
                    //MessageBox.Show(ex.InnerException.Message.ToString());
                    MessageBox.Show("An error occured while performing delete to the database. Please contact technician");
                    Application.Current.Shutdown();
                }
                catch (Exception ex)
                {
                    //MessageBox.Show(ex.InnerException.Message.ToString());
                    MessageBox.Show("An unknown error has occurred. Please contact technician");
                    Application.Current.Shutdown();
                }
            }
        }

        private void userListGridView_BeginningEdit(object sender, Telerik.Windows.Controls.GridViewBeginningEditRoutedEventArgs e)
        {
            ///*action when the user edit or add item, based on its index*/
            this.userListGridView.Columns[0].IsVisible = false; //hide delete button
            this.userListGridView.Columns[1].IsVisible = true; //show done button
            this.userListGridView.Columns[2].IsVisible = true; //show cancel button
        }

        private void userListGridView_RowValidating(object sender, Telerik.Windows.Controls.GridViewRowValidatingEventArgs e)
        {
            var rowContent = (e.Row.DataContext as TankControl.User);

        }

        private void userListGridView_CellValidating(object sender, Telerik.Windows.Controls.GridViewCellValidatingEventArgs e)
        {
            if (e.Cell.Column.UniqueName == "columnUsername")
            {
                using (TankControlEntities tce = new TankControlEntities())
                {
                    try
                    {
                        var query = (from a in tce.Users
                                     where a.username == e.NewValue
                                     select a).FirstOrDefault();
                        if (query != null)
                        {
                            //Telerik.Windows.Controls.GridViewCellValidationResult validationResult = new Telerik.Windows.Controls.GridViewCellValidationResult();
                            //validationResult.PropertyName = "Error";
                            //validationResult.ErrorMessage = "Username already taken";
                            //e.ValidationResults.Add(validationResult);
                            errorText.Content = "Username already taken";
                            e.IsValid = false;
                        }
                    }
                    catch (System.Data.EntityException ex)
                    {
                        //MessageBox.Show(ex.InnerException.Message.ToString());
                        MessageBox.Show("An error occured while performing query to the database. Please contact technician");
                        Application.Current.Shutdown();
                    }
                    catch (Exception ex)
                    {
                        //MessageBox.Show(ex.InnerException.Message.ToString());
                        MessageBox.Show("An unknown error has occurred. Please contact technician");
                        Application.Current.Shutdown();
                    }

                }
            }

        }
    }

    public class AuthenticationList
    {
        public int AuthenticationLevel { get; set; }
        public string AuthenticationName { get; set; }
    }
}
