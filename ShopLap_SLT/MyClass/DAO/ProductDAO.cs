﻿using MyClass.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyClass.DAO
{
    public class ProductDAO
    {
        private MyDBContext db = new MyDBContext();
        public List<Product> getList(string status = "All")
        {
            List<Product> list = null;
            switch (status)
            {
                case "Index":
                    list = db.Products.Where(m => m.Status != 0).ToList();
                    break;
                case "Trash":
                    list = db.Products.Where(m => m.Status == 0).ToList();
                    break;
                default:
                    list = db.Products.ToList();
                    break;
            }
            return list;
        }
        public Product getRow(int? id)
        {
            if (id == null)
            {
                return null;
            }
            else
            {
                return db.Products.Find(id);
            }
        }
        //Thêm
        public int Insert(Product row)
        {
            db.Products.Add(row);
            return db.SaveChanges();
        }
        //Cập nhật
        public int Update(Product row)
        {
            db.Entry(row).State = EntityState.Modified;
            return db.SaveChanges();
        }
        //Xóa
        public int Delete(Product row)
        {
            db.Products.Remove(row);
            return db.SaveChanges();
        }
    }
}
