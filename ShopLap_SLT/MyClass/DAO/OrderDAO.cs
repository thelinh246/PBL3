﻿using MyClass.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyClass.DAO
{
    public class OrderDAO
    {
        private MyDBContext db = new MyDBContext();
        public List<Order> getList(string status = "All")
        {
            List<Order> list = null;
            switch (status)
            {
                case "Index":
                    list = db.Orders.Where(m => m.Status != 0).ToList();
                    break;
                case "Trash":
                    list = db.Orders.Where(m => m.Status == 0).ToList();
                    break;
                default:
                    list = db.Orders.ToList();
                    break;
            }
            return list;
        }
        public Order getRow(int? id)
        {
            if (id == null)
            {
                return null;
            }
            else
            {
                return db.Orders.Find(id);
            }
        }
        //Thêm
        public int Insert(Order row)
        {
            db.Orders.Add(row);
            return db.SaveChanges();
        }
        //Cập nhật
        public int Update(Order row)
        {
            db.Entry(row).State = EntityState.Modified;
            return db.SaveChanges();
        }
        //Xóa
        public int Delete(Order row)
        {
            db.Orders.Remove(row);
            return db.SaveChanges();
        }
    }
}
