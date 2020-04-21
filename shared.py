import time
import asyncio
import multiprocessing
shared =5

async def p1(lock):
    global shared
    x=shared
    lock.acquire()
    x=x+1
    lock.release()
    await asyncio.sleep(1)
    shared=x
    print(shared)
    return shared

async def p2(lock):
    global shared
    y=shared
    lock.acquire()
    y=y-1
    lock.release()
    await asyncio.sleep(1) 
    shared=y
    print(shared)
    return shared

async def main():
    lock=multiprocessing.Lock()
    task1=asyncio.create_task(p1(lock))
    task2=asyncio.create_task(p2(lock))
    await asyncio.gather(task1,task2)

asyncio.run(main())