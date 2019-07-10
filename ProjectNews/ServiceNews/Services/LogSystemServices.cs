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
    public interface ILogSystemServices
    {
        LogSystem Add(LogSystem _model);

        IEnumerable<LogSystem> All();

        LogSystemView GetAll(string _keyWords, string _userName, DateTime? _fromDate, DateTime? _toDate, int? _pageIndex, int? _pageSize);

        IEnumerable<LogSystem> GetByUserName(string _userName);

        LogSystem GetById(int _id);

        void Save();
    }
    public class LogSystemServices : ILogSystemServices
    {
        private ILogSystemRepository _Repository;
        private IUnitOfWork _unitOfWork;
        public LogSystemServices(ILogSystemRepository Repository, IUnitOfWork unitOfWork)
        {
            this._Repository = Repository;
            this._unitOfWork = unitOfWork;
        }

        public LogSystem Add(LogSystem _model)
        {
            return _Repository.Add(_model);
        }

        public LogSystemView GetAll(string _keyWords, string _userName, DateTime? _fromDate, DateTime? _toDate, int? _pageIndex, int? _pageSize)
        {
            var entitys = _Repository.GetAll();
            if (!string.IsNullOrEmpty(_keyWords))
            {
                entitys = entitys.Where(x => x.userAction.ToLower().Contains(_keyWords.ToLower().Trim()) || x.action.Contains(_keyWords.ToLower().Trim()));
            }
            if (!string.IsNullOrEmpty(_userName))
            {
                entitys = entitys.Where(x => x.userAction == _userName);
            }
            if (_fromDate.HasValue)
            {
                entitys = entitys.Where(x => x.createTime >= _fromDate.Value.Date);
            }
            if (_toDate.HasValue)
            {
                entitys = entitys.Where(x => x.createTime <= _toDate.Value.Date);
            }
            entitys = entitys.OrderByDescending(x => x.createTime);
            int totalRecord = entitys.Count();
            if (_pageIndex != null && _pageSize != null)
            {
                entitys = entitys.Skip((_pageIndex.Value - 1) * _pageSize.Value);
            }
            var totalPage = 0;
            if (_pageSize != null)
            {
                totalPage = (int)Math.Ceiling(1.0 * totalRecord / _pageSize.Value);
                entitys = entitys.Take(_pageSize.Value);
            }
            return new LogSystemView { ViewLogSystems = entitys, Total = totalPage };
        }

        public IEnumerable<LogSystem> All()
        {
            return _Repository.GetAll();
        }

        public IEnumerable<LogSystem> GetByUserName(string _userName)
        {
            return _Repository.GetByUserName(_userName);
        }

        public LogSystem GetById(int _id)
        {
            return _Repository.GetSingleById(_id);
        }

        public void Save()
        {
            _unitOfWork.Commit();
        }
    }
}
