using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Entities;
using Infraestructure.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API.Controllers;
public class PaisController : BaseController
{
    public TiendaCampusContext _context;
    public PaisController(TiendaCampusContext context)
    {
        _context = context;
    }
    [HttpGet]
    [ProducesResponseType(StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<ActionResult<IEnumerable<Pais>>> Get()
    {
        var nameVar = await _context.Paises.ToListAsync();
        return Ok(nameVar);
    }
}
