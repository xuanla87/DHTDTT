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
    public interface IContentServices
    {
        Content Add(Content _model);

        void Update(Content _model);

        Content Delete(int _id);

        Content Trash(int _id);

        Content UnTrash(int _id);

        ContentView GetAll(string _keyWords, DateTime? _fromDate, DateTime? _toDate, int? _parentId, string _contentKey, int? _languageId, bool? _isTrash, int? _pageIndex, int? _pageSize);

        IEnumerable<Content> GetOldById(int _id, int? _parentId, string _contentKey, int? _languageId, int? _pageSize);


        Content GetById(int _id);

        Content GetByAlias(string _alias);

        IEnumerable<DropdownModel> Dropdownlist(int _id, int? _curentId, string _key, int _languageId);

        string GetNameById(int? _id);

        void Save();
    }
    public class ContentServices : IContentServices
    {
        private IContentRepository _Repository;
        private IUnitOfWork _unitOfWork;

        public ContentServices(IContentRepository Repository, IUnitOfWork unitOfWork)
        {
            this._Repository = Repository;
            this._unitOfWork = unitOfWork;
        }

        public Content Add(Content _model)
        {
            return _Repository.Add(_model);
        }

        public Content Delete(int _id)
        {
            return _Repository.Delete((int)_id);
        }
        public ContentView GetAll(string _keyWords, DateTime? _fromDate, DateTime? _toDate, int? _parentId, string _contentKey, int? _languageId, bool? _isTrash, int? _pageIndex, int? _pageSize)
        {
            var enContent = _Repository.GetMulti(x => x.contentLanguageId == _languageId.Value && x.contentKey == _contentKey);
           
            if (!string.IsNullOrEmpty(_keyWords))
            {
                enContent = enContent.Where(x => x.contentName.ToLower().Contains(_keyWords.ToLower().Trim()) || x.contentAlias.Contains(_keyWords.ToLower().Trim()));
            }
            if (_isTrash.HasValue)
            {
                enContent = enContent.Where(x => x.isTrash == _isTrash);
            }
            if (_parentId.HasValue)
            {
                enContent = enContent.Where(x => x.contentParentId == _parentId);
            }
            if (_fromDate.HasValue)
            {
                enContent = enContent.Where(x => x.contentUpdateTime.Date >= _fromDate.Value.Date);
            }
            if (_toDate.HasValue)
            {
                enContent = enContent.Where(x => x.contentUpdateTime.Date <= _toDate.Value.Date);
            }
            enContent = enContent.OrderByDescending(x => x.contentCreateTime);
            int totalRecord = enContent.Count();
            if (_pageIndex != null && _pageSize != null)
            {
                enContent = enContent.Skip((_pageIndex.Value - 1) * _pageSize.Value);
            }
            var totalPage = 0;
            if (_pageSize != null)
            {
                totalPage = (int)Math.Ceiling(1.0 * totalRecord / _pageSize.Value);
                enContent = enContent.Take(_pageSize.Value);
            }
            return new ContentView { ViewContents = enContent, Total = totalPage, TotalRecord = totalRecord };
        }
        public IEnumerable<Content> GetOldById(int _id, int? _parentId, string _contentKey, int? _languageId, int? _pageSize)
        {
            var enContent = _Repository.GetAll();
            enContent = enContent.Where(x => x.contentId < _id);
            if (!string.IsNullOrEmpty(_contentKey))
            {
                enContent = enContent.Where(x => x.contentKey.ToLower() == _contentKey.ToLower().Trim());
            }
            if (_parentId.HasValue)
            {

                enContent = enContent.Where(x => x.contentParentId == _parentId);
            }
            if (_languageId.HasValue)
            {
                enContent = enContent.Where(x => x.contentLanguageId == _languageId.Value);
            }
            enContent = enContent.OrderByDescending(x => x.contentUpdateTime);
            int totalRecord = enContent.Count();
            var totalPage = 0;
            if (_pageSize != null)
            {
                totalPage = (int)Math.Ceiling(1.0 * totalRecord / _pageSize.Value);
                enContent = enContent.Take(_pageSize.Value);
            }
            return enContent;
        }
        public Content Trash(int _id)
        {
            var enContent = _Repository.GetSingleById((int)_id);
            if (enContent != null && enContent.isTrash == false)
                enContent.isTrash = true;
            _Repository.Update(enContent);
            Save();
            return enContent;
        }

        public Content UnTrash(int _id)
        {
            var enContent = _Repository.GetSingleById((int)_id);
            if (enContent != null && enContent.isTrash == true)
                enContent.isTrash = false;
            _Repository.Update(enContent);
            Save();
            return enContent;
        }

        public Content GetByAlias(string _alias)
        {
            if (!string.IsNullOrEmpty(_alias))
                return _Repository.GetByAlias(_alias);
            else
                return null;
        }

        public Content GetById(int _id)
        {
            return _Repository.GetSingleById((int)_id);
        }


        public string GetNameById(int? _id)
        {
            if (_id.HasValue)
            {
                var entity = _Repository.GetSingleById((int)_id.Value);
                if (entity != null && entity.contentName != null)
                    return entity.contentName;
                else return null;
            }
            else return null;
        }

        public IEnumerable<DropdownModel> Dropdownlist(int _id, int? _curentId, string _key, int _languageId)
        {
            try
            {
                var entitys = _Repository.GetMulti(x => x.isTrash == false && x.contentKey == _key && x.contentLanguageId == _languageId);
                if (_curentId.HasValue && _curentId > 0)
                    entitys = entitys.Where(x => x.contentId != _curentId && x.contentParentId != _curentId);
                int totalRecord = entitys.Count();
                var result = new List<DropdownModel>();
                foreach (var item in entitys)
                {
                    if (item.contentParentId == null || item.contentParentId == 0)
                    {
                        result.Add(new DropdownModel { Text = item.contentName, Value = item.contentId });
                        DropdownlistChild(result, entitys, (int)item.contentId, "-");
                    }
                }
                return result;
            }
            catch (Exception)
            {
                return new List<DropdownModel>();
            }
        }

        private IEnumerable<DropdownModel> DropdownlistChild(List<DropdownModel> model, IEnumerable<Content> entity, int _parentId, string st)
        {
            try
            {
                foreach (var item in entity)
                {
                    if (item.contentParentId == _parentId)
                    {
                        model.Add(new DropdownModel { Text = st + item.contentName, Value = item.contentId });
                        DropdownlistChild(model, entity, (int)item.contentId, st + st);
                    }
                }
                return model;
            }
            catch (Exception)
            {
                return model;
            }
        }

        public void Save()
        {
            _unitOfWork.Commit();
        }

        public void Update(Content _model)
        {
            _Repository.Update(_model);
        }
    }
}
