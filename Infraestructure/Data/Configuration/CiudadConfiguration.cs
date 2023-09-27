using Core.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Infraestructure.Data.Configuration;
public class CiudadConfiguracion : IEntityTypeConfiguration<Ciudad>
{

    public void Configure(EntityTypeBuilder<Ciudad> builder)
    {
        builder.ToTable("ciudad");
        builder.HasKey(e => e.id);
        builder.Property(e => e.id);

        builder.Property(p => p.Nombre).IsRequired().HasMaxLength(50);

        builder.HasOne(p => p.Departamentos).WithMany(p => p.ciudades).HasForeignKey(p => p.idDepartamentoFk);


    }


}
