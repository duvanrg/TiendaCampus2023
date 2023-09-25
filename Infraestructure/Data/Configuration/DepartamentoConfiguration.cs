using Core.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Infraestructure.Data.Configuration;
public class DepartamentoConfiguracion : IEntityTypeConfiguration<Departamento>
{

    public void Configure(EntityTypeBuilder<Departamento> builder)
    {
        builder.ToTable("departamento");
        builder.HasKey(e => e.id);
        builder.Property(e => e.id);

        builder.Property(p => p.Nombre).IsRequired().HasMaxLength(50);

        builder.HasOne(p => p.Paises).WithMany(p => p.Departamentos).HasForeignKey(p => p.idpaisFK);
    }


}