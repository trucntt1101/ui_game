
#include <QDebug>
#include "room_item.h"

RoomItem::RoomItem(QObject *parent)
    : QObject(parent)
{
}

RoomItem::RoomItem(const QString &name, QObject *parent)
    : QObject(parent), m_name(name)
{
}

QString RoomItem::name() const
{
    return m_name;
}

void RoomItem::setName(const QString &name)
{
    if (name != m_name) {
        m_name = name;
        emit nameChanged();
    }
}
