﻿using MyClass.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyClass.DAO
{
    public class SupplierDAO
    {
        private MyDBContext db = new MyDBContext();
        public List<Supplier> getList(string status = "All")
        {
            List<Supplier> list = null;
            switch (status)
            {
                case "Index":
                    list = db.Suppliers.Where(m => m.Status != 0).ToList();
                    break;
                case "Trash":
                    list = db.Suppliers.Where(m => m.Status == 0).ToList();
                    break;
                default:
                    list = db.Suppliers.ToList();
                    break;
            }
            return list;
        }
        public Supplier getRow(int? id)
        {
            if (id == null)
            {
                return null;
            }
            else
            {
                return db.Suppliers.Find(id);
            }
        }
        //Thêm
        public int Insert(Supplier row)
        {
            db.Suppliers.Add(row);
            return db.SaveChanges();
        }
        //Cập nhật
        public int Update(Supplier row)
        {
            db.Entry(row).State = EntityState.Modified;
            return db.SaveChanges();
        }
        //Xóa
        public int Delete(Supplier row)
        {
            db.Suppliers.Remove(row);
            return db.SaveChanges();
        }
    }
}
