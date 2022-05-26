#pragma once

#include <QAbstractListModel>
#include <QVector>
#include <array>
#include "data.h"
#include  <basketmodel.h>
#include  <algorithm>
class DataBaseModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(QString name READ returnNameOfClickedItem  NOTIFY itemChanged)
    Q_PROPERTY(QString cost READ returnCostOfClickedItem  NOTIFY itemChanged)
    Q_PROPERTY(QString weidht READ returnWeidhtOfClickedItem  NOTIFY itemChanged)
    Q_PROPERTY(QString picture READ returnPictureOfClickedItem  NOTIFY itemChanged)
    Q_PROPERTY(QString description READ returnDescriptionOfClickedItem  NOTIFY itemChanged)
public:

    enum{
        Name = Qt::UserRole+1,
        Cost,
        Weidght,
        Picture
    };
    explicit DataBaseModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;


    bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;

    QHash<int,QByteArray> roleNames()const override;

    void appendData(QVector<Data>&);

    Q_INVOKABLE  void sorting(int index);

    Q_INVOKABLE QObject* returnBasketModel();

    QString name; QString cost; QString weidht;QString picture;QString description;

    QVector<Data> dataShowing;

    BasketModel *basketModel;

    Q_INVOKABLE void addToCheckout(int index);

    QString returnNameOfClickedItem() const;
    QString returnWeidhtOfClickedItem() const;
    QString returnCostOfClickedItem() const;
    QString returnPictureOfClickedItem() const;
    QString returnDescriptionOfClickedItem() const;
    Q_INVOKABLE void getText(int index);

signals:
    void itemChanged();

    void signalToAddItem(Data);
};


