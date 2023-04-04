Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 709BB6D6810
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Apr 2023 17:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E1810E531;
	Tue,  4 Apr 2023 15:59:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9240A10E531
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Apr 2023 15:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680623951;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OeMolX1SxNFCB7moKC067zOF/AMbVP1lQf1Wv5j6Xz8=;
 b=FgUqs3JpuHwFpHjVxqrNQGb/9yUkRk9TnxeNqGxMpoTv/7ORgFs0KQc2GoDDb0ttTpgBZS
 LM4YVs0uaEQIbA6+xMhmjiFkQxkfJ27pi5x9fKckeClSc9rxehZdGSdVHGpGwIg7W+3B/u
 JlAmrDoNtYw2HTctY4Fhc13DDsqVrcY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-SzUfYq82OkCpETmAF172qA-1; Tue, 04 Apr 2023 11:59:09 -0400
X-MC-Unique: SzUfYq82OkCpETmAF172qA-1
Received: by mail-qv1-f72.google.com with SMTP id
 f3-20020a0cc303000000b005c9966620daso14707688qvi.4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 04 Apr 2023 08:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680623948;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OeMolX1SxNFCB7moKC067zOF/AMbVP1lQf1Wv5j6Xz8=;
 b=iG/PTq5DKFFGb62hVhpDxA2jvwfY1UerKSLs5cDCYVfj2XGdpRh/2IvWiQX6PrsmmJ
 vTM7fRwfdKjztyRC9q9Elu5RJROI3JftU1IffupSwi6eKDGwyRQ5CO+JFSVCMB797F+0
 yn0LFFL75IQcK3ExoABj8Dteo1Iw18SIHRFamfkDvu+eUMTHgD/DJDeTjnaF7Zji9qCR
 ehwfJiFYLmU04PqoyURRHMqeJUZSmnzMf6zpWHTU7ELS8S8S5pHQNaUfejJG05dLWrP3
 I1IGPzEpuRDFAtV+PE96QMx04ExKSxIVcnLBzzosS4T5zfaUfdJB+sfpoESTCfhz1sjL
 VvEA==
X-Gm-Message-State: AAQBX9cfBnoOMGgOj6SM0N3HifC/3HTUeWgbDDeu5fZNBGKubdC7Xi+x
 u9QZeAjyFzN3vEH308cZu5bmOcsLxfQwA+vpn0MArKrSZbXWglPCtVZbV1PzZtleUsk5xtX2uaa
 VpabKBmsukDqVhVMxTbjYi/chTjvjcsZN+g==
X-Received: by 2002:a05:6214:21ef:b0:56b:eef6:6937 with SMTP id
 p15-20020a05621421ef00b0056beef66937mr3307112qvj.50.1680623948321; 
 Tue, 04 Apr 2023 08:59:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350aE1kGETxiNn50t4CqJlkXH0s7kjlbQYgSms4cC9aLymjvrSVD/JeKgl7CVmeUlUbuRytDGDg==
X-Received: by 2002:a05:6214:21ef:b0:56b:eef6:6937 with SMTP id
 p15-20020a05621421ef00b0056beef66937mr3307074qvj.50.1680623948031; 
 Tue, 04 Apr 2023 08:59:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 bz16-20020ad44c10000000b005dd8b9345c0sm2073361qvb.88.2023.04.04.08.59.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 08:59:06 -0700 (PDT)
Message-ID: <5781064c-8742-d37d-57dc-7a7238e948d5@redhat.com>
Date: Tue, 4 Apr 2023 17:59:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 02/12] vfio/pci: Only check ownership of opened devices
 in hot reset
To: "Liu, Yi L" <yi.l.liu@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "Tian, Kevin" <kevin.tian@intel.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-3-yi.l.liu@intel.com>
 <844faa5c-2968-2a4f-8a70-900f359be1a0@redhat.com>
 <DS0PR11MB75290339DD0FD467146D4655C3939@DS0PR11MB7529.namprd11.prod.outlook.com>
 <fc87191d-2e79-83c3-b5ba-7f8b1083988a@redhat.com>
 <DS0PR11MB7529441450FE32DC9578C6B8C3939@DS0PR11MB7529.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <DS0PR11MB7529441450FE32DC9578C6B8C3939@DS0PR11MB7529.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "joro@8bytes.org" <joro@8bytes.org>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "Hao, Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "Zhao, Yan Y" <yan.y.zhao@intel.com>, "Xu, Terrence" <terrence.xu@intel.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>



On 4/4/23 17:29, Liu, Yi L wrote:
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Tuesday, April 4, 2023 11:19 PM
>>
>> Hi Yi,
>>
>> On 4/4/23 16:37, Liu, Yi L wrote:
>>> Hi Eric,
>>>
>>>> From: Eric Auger <eric.auger@redhat.com>
>>>> Sent: Tuesday, April 4, 2023 10:00 PM
>>>>
>>>> Hi YI,
>>>>
>>>> On 4/1/23 16:44, Yi Liu wrote:
>>>>> If the affected device is not opened by any user, it's safe to reset it
>>>>> given it's not in use.
>>>>>
>>>>> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
>>>>> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>>>>> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
>>>>> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
>>>>> ---
>>>>>  drivers/vfio/pci/vfio_pci_core.c | 14 +++++++++++---
>>>>>  include/uapi/linux/vfio.h        |  8 ++++++++
>>>>>  2 files changed, 19 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
>>>>> index 65bbef562268..5d745c9abf05 100644
>>>>> --- a/drivers/vfio/pci/vfio_pci_core.c
>>>>> +++ b/drivers/vfio/pci/vfio_pci_core.c
>>>>> @@ -2429,10 +2429,18 @@ static int vfio_pci_dev_set_hot_reset(struct
>>>> vfio_device_set *dev_set,
>>>>>  	list_for_each_entry(cur_vma, &dev_set->device_list, vdev.dev_set_list) {
>>>>>  		/*
>>>>> -		 * Test whether all the affected devices are contained by the
>>>>> -		 * set of groups provided by the user.
>>>>> +		 * Test whether all the affected devices can be reset by the
>>>>> +		 * user.
>>>>> +		 *
>>>>> +		 * Resetting an unused device (not opened) is safe, because
>>>>> +		 * dev_set->lock is held in hot reset path so this device
>>>>> +		 * cannot race being opened by another user simultaneously.
>>>>> +		 *
>>>>> +		 * Otherwise all opened devices in the dev_set must be
>>>>> +		 * contained by the set of groups provided by the user.
>>>>>  		 */
>>>>> -		if (!vfio_dev_in_groups(cur_vma, groups)) {
>>>>> +		if (cur_vma->vdev.open_count &&
>>>>> +		    !vfio_dev_in_groups(cur_vma, groups)) {
>>>>>  			ret = -EINVAL;
>>>>>  			goto err_undo;
>>>>>  		}
>>>>> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
>>>>> index 0552e8dcf0cb..f96e5689cffc 100644
>>>>> --- a/include/uapi/linux/vfio.h
>>>>> +++ b/include/uapi/linux/vfio.h
>>>>> @@ -673,6 +673,14 @@ struct vfio_pci_hot_reset_info {
>>>>>   * VFIO_DEVICE_PCI_HOT_RESET - _IOW(VFIO_TYPE, VFIO_BASE + 13,
>>>>>   *				    struct vfio_pci_hot_reset)
>>>>>   *
>>>>> + * Userspace requests hot reset for the devices it uses.  Due to the
>>>>> + * underlying topology, multiple devices can be affected in the reset
>>>> by the reset
>>>>> + * while some might be opened by another user.  To avoid interference
>>>> s/interference/hot reset failure?
>>> I don’t think user can really avoid hot reset failure since there may
>>> be new devices plugged into the affected slot. Even user has opened
>> I don't know the legacy wrt that issue but this sounds a serious issue,
>> meaning the reset of an assigned device could impact another device
>> belonging to another group not not owned by the user?
> but the hot reset shall fail as the group is not owned by the user.

sure it shall but I fail to understand if the reset fails or the device
plug is somehow delayed until the reset completes.
>
>>> all the groups/devices reported by VFIO_DEVICE_GET_PCI_HOT_RESET_INFO,
>>> the hot reset can fail if new device is plugged in and has not been
>>> bound to vfio or opened by another user during the window of
>>> _INFO and HOT_RESET.
>> with respect to the latter isn't the dev_set lock held during the hot
>> reset and sufficient to prevent any new opening to occur?
> yes. new open needs to acquire the dev_set lock. So when hot reset
> acquires the dev_set lock, then no new open can occur. 
>
> Regards,
> Yi Liu
>
>>> maybe the whole statement should be as below:
>>>
>>> To avoid interference, the hot reset can only be conducted when all
>>> the affected devices are either opened by the calling user or not
>>> opened yet at the moment of the hot reset attempt.
>> OK
>>
>> Eric
>>>>> + * the calling user must ensure all affected devices, if opened, are
>>>>> + * owned by itself.
>>>>> + *
>>>>> + * The ownership is proved by an array of group fds.
>>>>> + *
>>>>>   * Return: 0 on success, -errno on failure.
>>>>>   */
>>>>>  struct vfio_pci_hot_reset {
>>> Regards,
>>> Yi Liu

