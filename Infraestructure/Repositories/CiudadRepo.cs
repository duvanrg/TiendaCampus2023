using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Entities;
using Core.Interfaces;
using Infraestructure.Data;

namespace Infraestructure.Repositories;

public class CiudadRepo : GenericRepo<Ciudad>, ICiudad
{
    private readonly TiendaCampusContext _context;

    public CiudadRepo(TiendaCampusContext context) : base(context)
    {
        _context = context;
    }
}
