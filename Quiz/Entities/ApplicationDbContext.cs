using Microsoft.EntityFrameworkCore;

namespace Quiz.Entities;

public class ApplicationDbContext : DbContext
{
    public ApplicationDbContext(DbContextOptions option) : base(option) { }

    public DbSet<User> TblUsers { get; set; }
    public DbSet<Test> TblTests { get; set; }
    public DbSet<UserTest> TblUserTests { get; set; }
    public DbSet<NetworkInfo> TblNetworkInfos { get; set; }
}
