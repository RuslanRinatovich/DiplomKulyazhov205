using Microsoft.Maps.MapControl.WPF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using EduInstitutesApp.Models;
using EduInstitutesApp.Windows;
using System.Data.Entity;

namespace EduInstitutesApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для ServicesPage.xaml
    /// </summary>
    public partial class ServicesPage : Page
    {
        List<Service> categories;
        public ServicesPage()
        {
            InitializeComponent();
        }


        void LoadData()
        {
            try
            {
                DtData.ItemsSource = null;
                //загрузка обновленных данных
                OrganizationDBEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                categories = OrganizationDBEntities.GetContext().Services.OrderBy(p => p.Title).ToList();
                DtData.ItemsSource = categories;
            }
            catch
            {
                MessageBox.Show("Ошибка");
            }
        }
        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            //событие отображения данного Page
            // обновляем данные каждый раз когда активируется этот Page
            if (Visibility == Visibility.Visible)
            {
                LoadData();
            }
        }

        private void DataGridGoodLoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }


        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            try
            {


                ServiceWindow window = new ServiceWindow(new Service());
                if (window.ShowDialog() == true)
                {
                    OrganizationDBEntities.GetContext().Services.Add(window.currentItem);
                    OrganizationDBEntities.GetContext().SaveChanges();
                    LoadData();
                    MessageBox.Show("Запись добавлена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch
            {
                MessageBox.Show("Ошибка");
            }
        }

        private void btnChange_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                // если ни одного объекта не выделено, выходим
                if (DtData.SelectedItem == null) return;
                // получаем выделенный объект
                Service selected = DtData.SelectedItem as Service;


                ServiceWindow window = new ServiceWindow(
                    new Service
                    {
                        Id = selected.Id,
                        Title = selected.Title,
                    }
                    );

                if (window.ShowDialog() == true)
                {
                    selected = OrganizationDBEntities.GetContext().Services.Find(window.currentItem.Id);
                    // получаем измененный объект
                    if (selected != null)
                    {

                        selected.Id = window.currentItem.Id;
                        selected.Title = window.currentItem.Title;
                        OrganizationDBEntities.GetContext().Entry(selected).State = EntityState.Modified;
                        OrganizationDBEntities.GetContext().SaveChanges();
                        LoadData();
                        MessageBox.Show("Запись изменена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                }
            }
            catch
            {
                MessageBox.Show("Ошибка");
            }

        }


        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                // если ни одного объекта не выделено, выходим
                if (DtData.SelectedItem == null) return;
                // получаем выделенный объект
                MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить запись? ", "Удаление", MessageBoxButton.OKCancel,
MessageBoxImage.Question);
                if (messageBoxResult == MessageBoxResult.OK)
                {
                    Service deletedItem = DtData.SelectedItem as Service;


                    OrganizationDBEntities.GetContext().ServiceOrganizations.Load();
                    var list = OrganizationDBEntities.GetContext().ServiceOrganizations.Local;
                    int k = 0;
                    foreach (ServiceOrganization item in list)
                    {
                        if (item.ServiceOrganizationId == deletedItem.Id)
                            k++;
                    }
                    // MessageBox.Show(k.ToString());
                    if (k > 0)
                    {
                        MessageBox.Show("Ошибка удаления, есть связанные записи", "Error",
                            MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                    OrganizationDBEntities.GetContext().Services.Remove(deletedItem);
                    OrganizationDBEntities.GetContext().SaveChanges();
                    MessageBox.Show("Запись удалена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка, есть связанные записи");
            }
            finally
            {
                LoadData();
            }
        }
    }
}


