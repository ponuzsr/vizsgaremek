using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace backend.Models;

public partial class Comment
{
    public Guid Id { get; set; }
    public string PostComment { get; set; } = null!;

    public DateTime CreatedTime { get; set; }
    
    public string CommenteloId { get; set; }
    public Guid AutoId { get; set; }

    [JsonIgnore]
    public virtual ApplicationUser Commentelo { get; set; } = null!;
    [JsonIgnore]
    public virtual Autok Auto { get; set; } = null!;
}
