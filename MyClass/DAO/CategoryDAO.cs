﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyClass.Models;

namespace MyClass.DAO
{
    public class CategoryDAO
    {
        private MyDBContext db = new MyDBContext();
        public List<Category> getList(string status="All")
        {
            List<Category> list = null;
            switch(status)
            { 
                case "Index":
                    list = db.Categorys.Where(m => m.Status != 0).ToList();
                    break;
                case "Trash":
                    list = db.Categorys.Where(m => m.Status == 0).ToList();
                    break;
                default:
                    list = db.Categorys.ToList();
                    break;
            }    
            return list;
        }    
        public Category getRow(int? id)
        {
            if (id != null)
            {
                return null;
            }else
            {
                return db.Categorys.Find(id);
            }    
        }
        //Thêm
        public int Insert(Category row)
        {
            db.Categorys.Add(row);
            return db.SaveChanges();
        }
        //Cập nhật
        public int Update(Category row)
        {
            db.Entry(row).State = EntityState.Modified;
            return db.SaveChanges();
        }
        //Xóa
        public int Delete(Category row)
        {
            db.Categorys.Remove(row);
            return db.SaveChanges();
        }
    }
}
