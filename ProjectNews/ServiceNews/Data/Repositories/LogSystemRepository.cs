namespace ServiceNews.Data.Repositories
{
    using ServiceNews.Data.Infrastructure;
    using ServiceNews.Models;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    public interface ILogSystemRepository : IRepository<LogSystem>
    {
        IEnumerable<LogSystem> GetByUserName(string _userName);
    }
    public class LogSystemRepository : Repository<LogSystem>, ILogSystemRepository
    {
        public LogSystemRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }

        public IEnumerable<LogSystem> GetByUserName(string _userName)
        {
            return this.DbContext.LogSystems.Where(x => x.userAction == _userName);
        }
    }
}
