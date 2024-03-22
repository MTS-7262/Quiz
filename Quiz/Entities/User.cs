using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Quiz.Entities;

public class User
{
    [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int ID { get; set; }
    public string UserName { get; set; } = string.Empty;
    public string FirstName { get; set; } = string.Empty;
    public string LastName { get; set; } = string.Empty;
    public string Number { get; set; } = string.Empty;
    public int Wins { get; set; }
    public int Losses { get; set; }

    //Navigation Properties
    public NetworkInfo NetworkInfo { get; set; }

    public List<UserTest> UserTests { get; set; }
}
