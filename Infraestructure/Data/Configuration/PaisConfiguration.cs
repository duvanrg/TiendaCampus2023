using Core.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Infraestructure.Data.Configuration;
public class PaisConfiguracion : IEntityTypeConfiguration<Pais>
{

    public void Configure(EntityTypeBuilder<Pais> builder)
    {
        builder.ToTable("pais");
        builder.HasKey(e => e.id);
        builder.Property(e => e.id);

        builder.Property(p => p.Nombre).IsRequired().HasMaxLength(50);

    }


}