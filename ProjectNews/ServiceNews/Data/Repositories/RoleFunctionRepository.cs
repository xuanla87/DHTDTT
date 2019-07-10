namespace ServiceNews.Data.Repositories
{
    using ServiceNews.Data.Infrastructure;
    using ServiceNews.Models;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    public interface IRoleFunctionRepository : IRepository<RoleFunction>
    {
        IEnumerable<RoleFunction> GetByUserName(string _userName);
        RoleFunction GetByCode(string _code);
        RoleFunction GetByUserNameCode(string _userName, string _code);
    }
    public class RoleFunctionRepository : Repository<RoleFunction>, IRoleFunctionRepository
    {
        public RoleFunctionRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }

        public IEnumerable<RoleFunction> GetByUserName(string _userName)
        {
            return this.DbContext.RoleFunctions.Where(x => x.UserName == _userName);
        }

        public RoleFunction GetByCode(string _code)
        {
            return this.DbContext.RoleFunctions.FirstOrDefault(x => x.CodeFunction == _code);
        }

        public RoleFunction GetByUserNameCode(string _uerName, string _code)
        {
            return this.DbContext.RoleFunctions.FirstOrDefault(x => x.CodeFunction == _code && x.UserName == _uerName);
        }
    }
}
