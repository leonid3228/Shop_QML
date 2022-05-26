#include "database.h"
#include <QStandardPaths>
#include <QDir>
#include <QFile>
#include <QString>
#include <QVector>
#include <algorithm>
DataBase::DataBase(QObject *parent) : QObject(parent){}

DataBase::~DataBase(){}
void DataBase::connectToDataBase()
{

    if(!QFile("C:/Users/User/Desktop/qt/Store/" DATABASE_NAME).exists()){
        this->restoreDataBase();
    } else {
        this->openDataBase();
    }
    DataBase::returnFromDataBase();
}

void DataBase::returnFromDataBase()
{

    QSqlQuery query{"SELECT * FROM NameTable" };
    QSqlRecord rec = query.record();
    const int catIndex = rec.indexOf( PRODUCT_CATEGORY );
    const int nameIndex = rec.indexOf( PRODUCT_NAME);
    const int costIndex = rec.indexOf( PRODUCT_COST);
    const int weidhtIndex = rec.indexOf( PRODUCT_WEIDHT);
    const int pictureIndex = rec.indexOf( PRODUCT_PICTURE);
    const int descriptionIndex = rec.indexOf( PRODUCT_DESCRIPTION);
    while( query.next() ) {
        Data listquery;
        listquery.category.append( query.value( catIndex ).toString());
        listquery.name.append( query.value( nameIndex ).toString());
        listquery.cost.append( query.value( costIndex ).toString());
        listquery.weidht.append( query.value( weidhtIndex ).toString());
        listquery.picPath.append( query.value( pictureIndex ).toString());
        listquery.description.append( query.value( descriptionIndex ).toString());
        data.append(listquery);
    }


}

int DataBase::sizeOfDataBase()
{
    return data.size();
}

void DataBase::sort()
{
    std::sort(data.begin(),data.end(),[](Data a,Data b){
        return a.category>b.category;
    });
}

bool DataBase::restoreDataBase()
{

    if(this->openDataBase()){

        return (this->createTable()) ? true : false;
    }
    return false;
}

bool DataBase::openDataBase()
{

    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setHostName(DATABASE_HOSTNAME);
    db.setDatabaseName("C:/Users/User/Desktop/qt/Store/" DATABASE_NAME);
    db.open();
    return true;
}

void DataBase::closeDataBase()
{
    db.close();
}

bool DataBase::createTable()
{

    QSqlQuery query;
    if(!query.exec( "CREATE TABLE " TABLE " ("
                    "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                    PRODUCT_CATEGORY      " VARCHAR(255)    NOT NULL,"
                    PRODUCT_NAME       " VARCHAR(255)    NOT NULL,"
                    PRODUCT_COST        " VARCHAR(255)    NOT NULL,"
                    PRODUCT_WEIDHT        " VARCHAR(255)    NOT NULL,"
                    PRODUCT_PICTURE        " VARCHAR(255)    NOT NULL,"
                    PRODUCT_DESCRIPTION      " VARCHAR(255)    NOT NULL" " )"
                    )){
        qDebug() << "DataBase: error of create " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}
