using MyClass.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyClass.DAO
{
    public class PostDAO
    {
        private MyDBContext db = new MyDBContext();
        public List<Post> getList(string status = "All")
        {
            List<Post> list = null;
            switch (status)
            {
                case "Index":
                    list = db.Posts.Where(m => m.Status != 0).ToList();
                    break;
                case "Trash":
                    list = db.Posts.Where(m => m.Status == 0).ToList();
                    break;
                default:
                    list = db.Posts.ToList();
                    break;
            }
            return list;
        }
        public Post getRow(int? id)
        {
            if (id == null)
            {
                return null;
            }
            else
            {
                return db.Posts.Find(id);
            }
        }
        //Thêm
        public int Insert(Post row)
        {
            db.Posts.Add(row);
            return db.SaveChanges();
        }
        //Cập nhật
        public int Update(Post row)
        {
            db.Entry(row).State = EntityState.Modified;
            return db.SaveChanges();
        }
        //Xóa
        public int Delete(Post row)
        {
            db.Posts.Remove(row);
            return db.SaveChanges();
        }
    }
}
