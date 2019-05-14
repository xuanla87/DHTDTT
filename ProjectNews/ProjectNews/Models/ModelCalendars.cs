using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectNews.Models
{
    public class ModelCalendars
    {
        public int CalendarId { get; set; }
        public string CalendarName { get; set; }
        public string CalendarBody { get; set; }
        public int UnitId { get; set; }
    }
}