#pragma once

#include <QObject>
#include <QSql>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlDatabase>
#include <QFile>
#include <QSqlRecord>
#include <QDebug>
#include <memory>
#include <QVector>
#include <data.h>
#define DATABASE_HOSTNAME   "NameDataBase"
#define DATABASE_NAME       "Name.db"

#define TABLE                           "NameTable"
#define PRODUCT_CATEGORY                "Category"
#define PRODUCT_NAME                    "Name"
#define PRODUCT_COST                    "Cost"
#define PRODUCT_WEIDHT                  "Weidht"
#define PRODUCT_PICTURE                 "PicturePath"
#define PRODUCT_DESCRIPTION              "Description"

class DataBase : public QObject
{
    Q_OBJECT
public: 
    explicit DataBase(QObject *parent = 0);
    ~DataBase();
    QVector<Data> data;
    void connectToDataBase();
    void returnFromDataBase();
    int sizeOfDataBase();
    void sort();

private:
    QSqlDatabase    db;

private:
    bool openDataBase();
    bool restoreDataBase();
    void closeDataBase();
    bool createTable();
};

