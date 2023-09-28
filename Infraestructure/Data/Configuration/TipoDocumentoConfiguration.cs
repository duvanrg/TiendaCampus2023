using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Infraestructure.Data.Configuration
{
    public class TipoDocumentoConfiguration : IEntityTypeConfiguration<TipoDocumento>
    {
        public void Configure(EntityTypeBuilder<TipoDocumento> builder)
        {
            builder.ToTable("tipodocumento");

            builder.HasKey(e=>e.id);
            builder.Property(e=>e.id);

            builder.Property(e=>e.Descripcion).IsRequired().HasMaxLength(50);
        }

    }
}