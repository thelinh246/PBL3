using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MyClass.Models;

namespace ShopLap_SLT.Areas.Admin.Controllers
{
    public class SuppliderController : Controller
    {
        private MyDBContext db = new MyDBContext();

        // GET: Admin/Supplider
        public ActionResult Index()
        {
            return View(db.Supplider.ToList());
        }

        // GET: Admin/Supplider/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Supplider supplider = db.Supplider.Find(id);
            if (supplider == null)
            {
                return HttpNotFound();
            }
            return View(supplider);
        }

        // GET: Admin/Supplider/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Supplider/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Slug,Img,Address,Phone,Email,Order,CreatedBy,CreatedAt,UpdateBy,UpdateAt,Status")] Supplider supplider)
        {
            if (ModelState.IsValid)
            {
                db.Supplider.Add(supplider);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(supplider);
        }

        // GET: Admin/Supplider/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Supplider supplider = db.Supplider.Find(id);
            if (supplider == null)
            {
                return HttpNotFound();
            }
            return View(supplider);
        }

        // POST: Admin/Supplider/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Slug,Img,Address,Phone,Email,Order,CreatedBy,CreatedAt,UpdateBy,UpdateAt,Status")] Supplider supplider)
        {
            if (ModelState.IsValid)
            {
                db.Entry(supplider).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(supplider);
        }

        // GET: Admin/Supplider/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Supplider supplider = db.Supplider.Find(id);
            if (supplider == null)
            {
                return HttpNotFound();
            }
            return View(supplider);
        }

        // POST: Admin/Supplider/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Supplider supplider = db.Supplider.Find(id);
            db.Supplider.Remove(supplider);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
