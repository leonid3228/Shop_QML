#pragma once
#include "database.h"
#include "QVector"
#include <QAbstractListModel>
#include <QMap>
#include <algorithm>
#include <QString>
#include "database.h"
#include "databasemodel.h"
class Selector : public QAbstractListModel
{
    Q_OBJECT

public:
    enum{
      Category = Qt::UserRole+1,
    };

    explicit Selector(QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;

    QHash<int,QByteArray> roleNames()const override;

    Q_INVOKABLE QObject* returnShowingModel();

    Q_INVOKABLE void dataForUpdateModel(QString);

    Q_INVOKABLE void dataForUpdateAllItem();
    Q_INVOKABLE void dataForUpdateModelWithSearcher(QString);

    DataBase* db;
    QVector<Data> allItem;

    QMap<QString,QVector<Data> > mapItem;


    Q_INVOKABLE DataBaseModel *baseModel ;
signals:
    void changeCategory( QVector<Data>);
};


