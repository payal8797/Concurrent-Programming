import asyncio


async def main():
    
    task1=asyncio.create_task(counting())
    task1=asyncio.create_task(time())

if__name__=="__main__":
asyncio.run(main())