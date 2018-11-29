using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TP_Instituto.Models;

namespace TP_Instituto.Controllers
{
    public class cursoController : Controller
    {
        private BaseInstitutoEntities db = new BaseInstitutoEntities();

        // GET: curso
        public ActionResult Index()
        {
            
                return View(db.curso.ToList());
        }

        // GET: curso/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            curso curso = db.curso.Find(id);
            if (curso == null)
            {
                return HttpNotFound();
            }
            return View(curso);
        }

        // GET: curso/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: curso/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idcurso,nombrecurso")] curso curso)
        {
            if (ModelState.IsValid)
            {
                db.curso.Add(curso);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(curso);
        }

        // GET: curso/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.Alumnos = db.Alumno.ToList();
            curso curso = db.curso.Find(id);
            if (curso == null)
            {
                return HttpNotFound();
            }
            ViewData["Alumnos"] = db.Alumno.ToList();
            ViewData["Profesores"] = db.Profesor.ToList();
            return View(curso);
        }

        // POST: curso/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idcurso, nombrecurso, Alumno")] curso curso)
        {
            if (ModelState.IsValid)
            {
                db.Entry(curso).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(curso);
        }

        // GET: curso/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            curso curso = db.curso.Find(id);
            if (curso == null)
            {
                return HttpNotFound();
            }
            return View(curso);
        }

        // POST: curso/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            curso curso = db.curso.Find(id);
            db.curso.Remove(curso);
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
