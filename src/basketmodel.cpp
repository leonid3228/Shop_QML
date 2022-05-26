#include "basketmodel.h"
#include "algorithm"
BasketModel::BasketModel(QObject *parent)
    : QAbstractListModel(parent){}

int BasketModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;

    if (parent.isValid())
        return 0;
    return  basket.size();
}

QVariant BasketModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    switch (role) {
    case Name:
        return QVariant(basket.at(index.row()).name);

    case NumberOfpositions:
        return QVariant(basket.at(index.row()).number);
    case Cost:
        return QVariant(basket.at(index.row()).cost);
    case Picture:
        return QVariant(basket.at(index.row()).image);



        return QVariant();
    }
}

bool BasketModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (!index.isValid()) {
        return false;
    }
    switch (role) {

       case NumberOfpositions:{
        basket.at(index.row()).number+=value.toInt(); totalCostCounter();
       if( basket.at(index.row()).number==0) DeleteItem();
       }
           break;
       default:
          return false;

      }

       emit dataChanged(index, index, QVector<int>() << role);
       return true;
}

Qt::ItemFlags BasketModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable;
}

void BasketModel::DeleteItem()
{
    auto result = std::remove_if(basket.begin(),basket.end(),[](Item &deleteItem){

            return deleteItem.number<=0;
});
    basket.erase(result,basket.end());

    beginResetModel();
    totalCostCounter();
    endResetModel();
}

QHash<int, QByteArray> BasketModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[Name] = "name";
    roles[Cost] = "cost";
    roles[Picture] = "picture";
    roles[NumberOfpositions] = "number";

    return roles;

}

bool BasketModel::slotWithAddingItem(Data addedItem)
{
    if(basket.size()==0){

        basket.push_back(addedItem);
        beginResetModel();
         totalCostCounter();
         endResetModel();
         return true;
    }

    for (auto it= basket.begin();it!=basket.end();it++){

        if (it->name == addedItem.name){
            it->number++;
            beginResetModel();
            totalCostCounter();
            endResetModel();
            return true;
        }
    }

    basket.push_back(addedItem);
    beginResetModel();
    totalCostCounter();
    endResetModel();
}

int BasketModel::totalCostCounter()
{
            int v_totalsumm = 0;
            for(auto it = basket.begin();it!=basket.end();++it){
                v_totalsumm += it->cost.toFloat()*it->number;
            }
            totalSumm = v_totalsumm;
            emit counterChanged();
            return totalSumm;
}
int BasketModel::counter() const
{
    return totalSumm;
}

