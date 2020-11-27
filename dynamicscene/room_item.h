#ifndef ROOM_ITEM_H
#define ROOM_ITEM_H
#include <QObject>

//![0]
class RoomItem : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
//![0]

public:
    RoomItem(QObject *parent=0);
    RoomItem(const QString &name, QObject *parent=0);

    QString name() const;
    void setName(const QString &name);

signals:
    void nameChanged();

private:
    QString m_name;
//![1]
};

#endif // ROOM_ITEM_H
