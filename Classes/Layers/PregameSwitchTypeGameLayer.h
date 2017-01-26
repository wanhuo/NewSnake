#ifndef __PREGAMESWITCHTYPEGAMELAYER_H__
#define __PREGAMESWITCHTYPEGAMELAYER_H__

#include <functional>
#include "Data/DataSetting.h"
#include "cocos2d.h"

class PregameSwitchTypeGameLayer : public cocos2d::Layer
{
public:
    static cocos2d::Scene* createScene();

    virtual bool init();

//    virtual void addChild(Node *child, int localZOrder);

    // implement the "static create()" method manually
    CREATE_FUNC(PregameSwitchTypeGameLayer);

private:

    cocos2d::MenuItemLabel *labelLP;
    cocos2d::MenuItemLabel *labelPP;
    cocos2d::MenuItemLabel *labelPB;
    cocos2d::MenuItemLabel *labelP;
    cocos2d::MenuItemLabel *labelB;

    cocos2d::MenuItemLabel *itemBack;
    cocos2d::MenuItemLabel *itemStart;

    float widthSolidRect;

    int flagStartServer;

    std::function<void(cocos2d::Ref*)> getCallbackClickLabel();

public:
    void setCallbackBackToMenu(const std::function<void(Ref *)> &value);
    void setFlagStartServer(bool value);

private:
    inline cocos2d::MenuItemLabel *getItem(GameType type) const;
    void initSwitchLabels();
    void initDrawNode();
    void initLabel(cocos2d::MenuItemLabel* &rvPtr, const std::string &text);
    void initNavigationMenu();

private:
    cocos2d::Size visibleSize;
    cocos2d::Vec2 origin;

};

#endif // __PREGAMESWITCHTYPEGAMELAYER_H__
