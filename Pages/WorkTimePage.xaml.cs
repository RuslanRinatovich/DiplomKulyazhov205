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
    /// Логика взаимодействия для WorkTimePage.xaml
    /// </summary>
    public partial class WorkTimePage : Page
    {
        List<WorkTime> items;
        public WorkTimePage()
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
                items = OrganizationDBEntities.GetContext().WorkTimes.OrderBy(p => p.Title).ToList();
                DtData.ItemsSource = items;
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


                WorkTimeWindow window = new WorkTimeWindow(new WorkTime());
                if (window.ShowDialog() == true)
                {
                    OrganizationDBEntities.GetContext().WorkTimes.Add(window.currentItem);
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
                WorkTime selected = DtData.SelectedItem as WorkTime;


                WorkTimeWindow window = new WorkTimeWindow(
                    new WorkTime
                    {
                        Id = selected.Id,
                        Title = selected.Title,
                    }
                    );

                if (window.ShowDialog() == true)
                {
                    selected = OrganizationDBEntities.GetContext().WorkTimes.Find(window.currentItem.Id);
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
                    WorkTime deletedItem = DtData.SelectedItem as WorkTime;


                    OrganizationDBEntities.GetContext().Organizations.Load();
                    var list = OrganizationDBEntities.GetContext().Organizations.Local;
                    int k = 0;
                    foreach (Organization item in list)
                    {
                        if (item.CategoryId == deletedItem.Id)
                            k++;
                    }
                    // MessageBox.Show(k.ToString());
                    if (k > 0)
                    {
                        MessageBox.Show("Ошибка удаления, есть связанные записи", "Error",
                            MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                    OrganizationDBEntities.GetContext().WorkTimes.Remove(deletedItem);
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

