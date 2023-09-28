using Core.Entities;
using Core.Interfaces;
using Infraestructure.Data;

namespace Infraestructure.Repositories;

public class PaisRepo : GenericRepo<Pais>, IPais
{
    private readonly TiendaCampusContext _context;

    public PaisRepo(TiendaCampusContext context) : base(context)
    {
        _context = context;
    }
}
