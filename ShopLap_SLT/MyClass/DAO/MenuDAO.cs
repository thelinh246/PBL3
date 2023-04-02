using MyClass.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyClass.DAO
{
    public class MenuDAO
    {
        private MyDBContext db = new MyDBContext();
        public List<Menu> getList(string status = "All")
        {
            List<Menu> list = null;
            switch (status)
            {
                case "Index":
                    list = db.Menus.Where(m => m.Status != 0).ToList();
                    break;
                case "Trash":
                    list = db.Menus.Where(m => m.Status == 0).ToList();
                    break;
                default:
                    list = db.Menus.ToList();
                    break;
            }
            return list;
        }
        public Menu getRow(int? id)
        {
            if (id == null)
            {
                return null;
            }
            else
            {
                return db.Menus.Find(id);
            }
        }
        //Thêm
        public int Insert(Menu row)
        {
            db.Menus.Add(row);
            return db.SaveChanges();
        }
        //Cập nhật
        public int Update(Menu row)
        {
            db.Entry(row).State = EntityState.Modified;
            return db.SaveChanges();
        }
        //Xóa
        public int Delete(Menu row)
        {
            db.Menus.Remove(row);
            return db.SaveChanges();
        }
    }
}
