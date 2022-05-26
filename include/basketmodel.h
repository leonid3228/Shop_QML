#pragma once
#include <QVector>
#include <QString>
#include <QAbstractListModel>
#include <QDebug>
#include "memory"
#include "data.h"
class BasketModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int total READ counter  NOTIFY counterChanged)

public:
    enum{
        Name = Qt::UserRole+1,
        Cost,
        Weidght,
        Picture,
        NumberOfpositions ,
    };

    struct Item{
        Item(){}
        QString name;
        QString cost;
        QString weidght;
        QString image;
        mutable int number;
        Item(Data data):name(data.name),cost(data.cost),weidght(data.weidht),image(data.picPath),number(1){}
    };

    explicit BasketModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole) override;

    QHash<int,QByteArray> roleNames()const override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;

    QVector<Item> basket ;

    Q_INVOKABLE void  DeleteItem();

    mutable int totalSumm = 0;

    Q_INVOKABLE int totalCostCounter();

public slots:
    bool slotWithAddingItem(Data);
    int counter() const;

signals:
    void counterChanged();
};

