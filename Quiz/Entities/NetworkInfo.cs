using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Quiz.Entities;

public class NetworkInfo
{
    [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int ID { get; set; }
    public string MAC_Address { get; set; } = string.Empty;

    //Naviagation Properties
    [ForeignKey(nameof(User))]
    public int User_ID { get; set; }
    public User User { get; set; }
}
