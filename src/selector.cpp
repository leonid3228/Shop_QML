#include "selector.h"
#include "cctype"
#include <QString>

Selector::Selector(QObject *parent)
    : QAbstractListModel(parent)
{
    db = new DataBase;
    db->connectToDataBase();
    baseModel = new DataBaseModel;
    baseModel->appendData(db->data);
    for (auto it = db->data.begin();it != db->data.end();++it) {
        auto elem = (mapItem.find(it->category));
        if (elem != mapItem. end())
        {
            QVector<Data> time {std::move(elem.value())};
            time.push_back(*it);
            mapItem[it->category]  = std::move(time);
        }
        else {
            QVector<Data> d{*it};
            mapItem.insert(it->category, std::move(d));
        }
    }

}

QDebug  & operator <<(QDebug  &out, const Data &u)
{
    out << u.name << u.cost;
    return out;}

int Selector::rowCount(const QModelIndex &parent) const
{    
    if (parent.isValid())
        return 0;
    return  mapItem.size();
}

QVariant Selector::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();
    switch (role) {
    case Category:
        return QVariant(mapItem.keys().at(index.row()));
        break;
    default:
        break;
    }

    return QVariant();
}

bool Selector::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (data(index, role) != value) {
        emit dataChanged(index, index, QVector<int>() << role);
        return true;
    }
    return false;
}

Qt::ItemFlags Selector::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable;
}

QHash<int, QByteArray> Selector::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[Category] = "category";
    return roles;
}

QObject *Selector::returnShowingModel()
{
    return baseModel;
}

void Selector::dataForUpdateModel(QString str)
{
    baseModel->appendData(mapItem[str]);

}

void Selector::dataForUpdateModelWithSearcher(QString str)
{
    QVector<Data> searchVector;

    for (auto it = mapItem.begin();it!=mapItem.end();++it){
        for ( auto it2 = it->begin();it2!=it->end();++it2){
            if(((it2->category).toLower())==str.toLower()||it2->name.toLower().contains(str.toLower())){

                searchVector.push_back(*it2);
            }
        }
    }
    baseModel->appendData(searchVector);
}

void Selector::dataForUpdateAllItem()
{
    baseModel->appendData(db->data);
}
