#include "databasemodel.h"
#include "selector.h"
#include <algorithm>

DataBaseModel::DataBaseModel(QObject *parent)
    : QAbstractListModel(parent)
{
    basketModel = new BasketModel;
    connect(this,signalToAddItem,basketModel,basketModel->slotWithAddingItem);
}

int DataBaseModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;

       return  dataShowing.size();
}

QVariant DataBaseModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    switch (role) {
    case Name:
          return QVariant(dataShowing.at(index.row()).name); break;
    case Cost:
         return QVariant(dataShowing.at(index.row()).cost); break;
    case Weidght:
         return QVariant(dataShowing.at(index.row()).weidht); break;
    case Picture:
         return QVariant(dataShowing.at(index.row()).picPath); break;
    default:
        break;
}
    return QVariant();
}

bool DataBaseModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (!index.isValid()) {
           return false;
       }
    emit dataChanged(index, index, QVector<int>() << role);
    return true;
}

Qt::ItemFlags DataBaseModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable; // FIXME: Implement me!
}

QHash<int, QByteArray> DataBaseModel::roleNames() const
{   
    QHash<int, QByteArray> roles;
    roles[Name] = "name";
    roles[Cost] = "cost";
    roles[Weidght] = "weidht";
    roles[Picture] = "picture";
    return roles;
}

void DataBaseModel::appendData(QVector<Data>& getData)
{
    dataShowing.clear();

    dataShowing.append(getData);

    beginResetModel();
    endResetModel();
}

void DataBaseModel::addToCheckout(int  index)
{
    emit signalToAddItem(dataShowing.at(index));
}
void DataBaseModel::sorting(int index)
{
    if(index==1){
        std::sort( dataShowing.begin(),dataShowing.end(),[](Data first,Data last){

            return  (first.cost.toFloat()>last.cost.toFloat());

        });}

    if(index==0){
        std::sort( dataShowing.begin(),dataShowing.end(),[](Data first,Data last){

            return  (first.cost.toFloat()<last.cost.toFloat());

        });}

    beginResetModel();
    endResetModel();
}

QObject *DataBaseModel::returnBasketModel()
{
    return basketModel;
}

void DataBaseModel::getText(int index)
{

    name = (dataShowing.at(index).name);
    cost = (dataShowing.at(index).cost);
    weidht = (dataShowing.at(index).weidht);
    picture = (dataShowing.at(index).picPath);
    description = (dataShowing.at(index).description);
}



QString DataBaseModel::returnNameOfClickedItem() const
{
    return name;
}

QString DataBaseModel::returnWeidhtOfClickedItem() const
{
    return weidht;
}

QString DataBaseModel::returnCostOfClickedItem() const
{
    return cost;
}

QString DataBaseModel::returnPictureOfClickedItem() const
{
    return picture;
}

QString DataBaseModel::returnDescriptionOfClickedItem() const
{
   return description;
}




