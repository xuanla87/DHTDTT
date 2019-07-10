namespace ServiceNews.Services
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using ServiceNews.Data.Infrastructure;
    using ServiceNews.Data.Repositories;
    using ServiceNews.Models;
    public interface IRoleFunctionServices
    {
        RoleFunction Add(RoleFunction _model);

        IEnumerable<RoleFunction> All();

        IEnumerable<RoleFunction> GetByUserName(string _userName);

        RoleFunction GetById(int _id);
        RoleFunction GetByCode(string _code);
        RoleFunction GetByUserNameCode(string _userName, string _code);

        void Save();
    }
    public class RoleFunctionServices : IRoleFunctionServices
    {
        private IRoleFunctionRepository _Repository;
        private IUnitOfWork _unitOfWork;
        public RoleFunctionServices(IRoleFunctionRepository Repository, IUnitOfWork unitOfWork)
        {
            this._Repository = Repository;
            this._unitOfWork = unitOfWork;
        }

        public RoleFunction Add(RoleFunction _model)
        {
            if (_model.Id > 0)
                _Repository.Update(_model);
            else
                _Repository.Add(_model);
            _unitOfWork.Commit();
            return _model;
        }

        public IEnumerable<RoleFunction> All()
        {
            return _Repository.GetAll();
        }

        public IEnumerable<RoleFunction> GetByUserName(string _userName)
        {
            return _Repository.GetByUserName(_userName);
        }

        public RoleFunction GetById(int _id)
        {
            return _Repository.GetSingleById(_id);
        }
        public RoleFunction GetByCode(string _code)
        {
            return _Repository.GetByCode(_code);
        }

        public RoleFunction GetByUserNameCode(string _userName, string _code)
        {
            return _Repository.GetByUserNameCode(_userName, _code);
        }
        public void Save()
        {
            _unitOfWork.Commit();
        }
    }
}
