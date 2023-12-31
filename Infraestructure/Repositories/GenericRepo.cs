using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Core.Entities;
using Core.Interfaces;
using Infraestructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infraestructure.Repositories;
public class GenericRepo<T> : IGenericRepo<T> where T : BaseEntity
{
    private TiendaCampusContext _context;
    public GenericRepo(TiendaCampusContext context)
    {
        _context = context;
    }

    public void Add(T entity)
    {
        _context.Set<T>().Add(entity);
    }

    public void AddRange(T entities)
    {
        _context.Set<T>().AddRange(entities);
    }

    public virtual IEnumerable<T> Find(Expression<Func<T, bool>> expression)
    {
        return _context.Set<T>().Where(expression);
    }

    public virtual async Task<IEnumerable<T>> GetAllAsync()
    {
        return await _context.Set<T>().ToListAsync();
    }

    public virtual async Task<T> GetByIdAsync(int id)
    {
        return await _context.Set<T>().FindAsync(id);
    }

    public virtual void Remove(T entity)
    {
        _context.Set<T>().Remove(entity);
    }

    public virtual void RemoveRange(T entities)
    {
        _context.Set<T>().Remove(entities);
    }

    public virtual void Update(T entity)
    {
        _context.Set<T>().Update(entity);
    }
}
