#ifndef __SNAKE_H__
#define __SNAKE_H__

#include "cocos2d.h"
#include <vector>
#include <functional>


NS_CC_BEGIN

using std::vector;

#define MAX_SNAKE_SPEED 20
#define MIN_SNAKE_SPEED 5

class Snake : public Layer {

public:
    enum Direction {Left = 0, Right, Up, Down, Zero};

    /* Data */
public:
    Snake  *opponent;
    Sprite *head;

private:
    int indexBackBlock;

protected:
    vector<Sprite*> snakeBlocks;
    Direction directionSnakeHead;
    Color3B colorBlockSnake;
    size_t lenghtSnake;
    size_t maxLengthSnake;
    float speedSnake;
    bool isMovingHeadSnake;

    /* Setter functions */
public:
    virtual void setPosition (const Vec2 &newPosition);
    virtual void setColor (const Color3B &color);
    virtual void setName (const std::string &name);
    virtual void setTag (int tag);

    void setSpeed(float speedSnake);

    inline void setMaxLength(size_t max_length) { this->maxLengthSnake = max_length; }

    /* Getter functions */
public:
    inline Direction getDirection () const { return directionSnakeHead;           }
    inline size_t    getLength    () const { return snakeBlocks.size()-1;         }
    inline float     getHeadWidth () const { return head->getContentSize().width; }
    inline float     getSpeed     () const { return speedSnake;                   }

    virtual const Vec2& getPosition () const;
    virtual float getPositionX() const { return head->getPositionX(); }
    virtual float getPositionY() const { return head->getPositionY(); }

    virtual const std::string& getName() const;
    virtual int getTag() const;

    /* else user functions */
public:
    void start();
    void stop();

    void addSnakeBlock (size_t add = 1);
    bool isContainer   (const Point &point, float maxDistance) const;
    void subSnake      (int sublen = 1);

    /* close methods */
protected:
    Snake();
    virtual bool init();
    virtual void movingHead(float delta) = 0;

protected:
    void movingSnakeBody(float f);
    void initLight();
    void initPhysicsBodyHead();
    Sprite *createBlockSnake();

};

NS_CC_END

#endif // __SNAKE_H__
