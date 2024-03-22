using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Quiz.Entities;

public class Test
{
    [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int ID { get; set; }
    public string Question { get; set; } = string.Empty;
    public string Option1 { get; set; } = string.Empty;
    public string Option2 { get; set; } = string.Empty;
    public string Option3 { get; set; } = string.Empty;
    public string Option4 { get; set; } = string.Empty;
    public string CurrectOption { get; set; } = string.Empty;
    public string Image { get; set; } = string.Empty;

    //Naviagation Properties
    public List<UserTest> UserTests { get; set; }

}
