#pragma once
#include <QString>
#include <QDebug>
struct Data{
    QString category;
    QString name;
    QString cost;
    QString weidht;
    QString picPath;
    QString description;
    Data() {
        category = ""; name = "";cost = "";weidht = "";picPath = "";description = "";
    }
    Data(QString cat,QString name,QString cost,QString weidht,QString picPath,QString descr):category(cat),name(name),cost(cost),weidht(weidht)
      ,picPath(picPath),description(descr){}

    bool operator<(const Data &d2)const  {
        return this->category > d2.category;
    }
    friend QDebug & operator << (QDebug & out, const Data &u);


};


