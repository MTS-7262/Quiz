using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Quiz.Entities;

public class UserTest
{
    [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int ID { get; set; }

    public string SelectedOption { get; set; }

    //Navigation Properties
    [ForeignKey(nameof(Test))]
    public int Test_ID { get; set; }
    public Test Test { get; set; }

    [ForeignKey(nameof(User))]
    public int User_ID { get; set; }
    public User User { get; set; }
}
