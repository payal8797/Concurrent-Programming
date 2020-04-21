import time
import asyncio
import multiprocessing
shared =200

async def deposit(lock,amount):
    global shared
    lock.acquire()
    shared=shared+amount
    lock.release()
    print(shared)
    await asyncio.sleep(1)
   
async def withdraw(lock,amount):
    global shared
    lock.acquire()
    shared=shared-amount
    lock.release()
    print(shared)
    await asyncio.sleep(1)

async def main():
    lock=multiprocessing.Lock()
    task1=asyncio.create_task(deposit(lock,200))
    task2=asyncio.create_task(withdraw(lock,200))
    await asyncio.gather(task1,task2)

asyncio.run(main())