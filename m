Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB426D6709
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Apr 2023 17:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C4810E6D3;
	Tue,  4 Apr 2023 15:19:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F379A10E6D3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Apr 2023 15:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680621553;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9h0qe2de4wpUWOB28748KnL4bo+TUsPB4FwOqLcCkxY=;
 b=D1mMil36xwHIY3aWU5Meqb8j+vAsG9pGdxf+67FvYrZ7U/hb2kbWc9theoXkx/stnlE9su
 bk5Exs81pSo98X8I/4CN4MH4E+jdSQHhhbr8zDPSmOh8oHSHrlmQ1skzFzEiocaENfeZ95
 kHSTDDoI99wrNL6hE8ISgYwXKKU73gM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-aTBGH18NN8WhWjyCCXtt6g-1; Tue, 04 Apr 2023 11:19:09 -0400
X-MC-Unique: aTBGH18NN8WhWjyCCXtt6g-1
Received: by mail-qv1-f71.google.com with SMTP id
 y19-20020ad445b3000000b005a5123cb627so14728811qvu.20
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 04 Apr 2023 08:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680621540;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9h0qe2de4wpUWOB28748KnL4bo+TUsPB4FwOqLcCkxY=;
 b=h66fFGLNLtcxWse/4AF6OCxpLRRv/4sYUqTpRalsr3d+C3hmrm1xGiHUEZnCN/Fco5
 pZjvnoizD3WooWzLZM7KZ1mgx2rD4DIJrm1mclXMtgYoidLcu5KtuHGpkpe4kmkv44f1
 6oxJEQppTi217mrDB7fEJfQ8WuviJz/FbB2fHVM7nNZefjkWqKQ8Jjh0onuXgwalBTnW
 ahkg+2haPAvQf590KwzCQdZ69mCcm4MtlhCTqFrzaCKp/iNLi1pBFdXabx8IvlVEHMBT
 ShENUjLrs/hM1N2XP8HQy7IjxG7b4Gt4TbfK1GtiNc/MEg1cPUqJnRgrZ4mIBkkl3foH
 x4wQ==
X-Gm-Message-State: AAQBX9ef2rMphKjZPegp90w8vms4jyUNsSdcYiqLfoirprIycgVu6qQN
 aHoR6KLbM8AxRS3M6TB4ytcpFsLcpSCMKNTwrzhMUocGPVb4h725W/l8irqwnPB4J7FNJaQ2v4n
 bQfJR3sHFvSsvNHYnM5ivFFaxp6Ggpf7InA==
X-Received: by 2002:a05:6214:c6b:b0:5d5:11b4:ad6 with SMTP id
 t11-20020a0562140c6b00b005d511b40ad6mr4092545qvj.5.1680621539863; 
 Tue, 04 Apr 2023 08:18:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350b/pUGHnnzAa/Is2PTZjxccUTN1xIqWGh6dFWoPmFhMxxL0nmFn4Q7QHgQ+QfiC+fi7gOde3g==
X-Received: by 2002:a05:6214:c6b:b0:5d5:11b4:ad6 with SMTP id
 t11-20020a0562140c6b00b005d511b40ad6mr4092477qvj.5.1680621539415; 
 Tue, 04 Apr 2023 08:18:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ea7-20020ad458a7000000b005dd8b9345a7sm3427407qvb.63.2023.04.04.08.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 08:18:57 -0700 (PDT)
Message-ID: <fc87191d-2e79-83c3-b5ba-7f8b1083988a@redhat.com>
Date: Tue, 4 Apr 2023 17:18:52 +0200
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
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <DS0PR11MB75290339DD0FD467146D4655C3939@DS0PR11MB7529.namprd11.prod.outlook.com>
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

Hi Yi,

On 4/4/23 16:37, Liu, Yi L wrote:
> Hi Eric,
>
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Tuesday, April 4, 2023 10:00 PM
>>
>> Hi YI,
>>
>> On 4/1/23 16:44, Yi Liu wrote:
>>> If the affected device is not opened by any user, it's safe to reset it
>>> given it's not in use.
>>>
>>> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
>>> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>>> Tested-by: Yanting Jiang <yanting.jiang@intel.com>
>>> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
>>> ---
>>>  drivers/vfio/pci/vfio_pci_core.c | 14 +++++++++++---
>>>  include/uapi/linux/vfio.h        |  8 ++++++++
>>>  2 files changed, 19 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
>>> index 65bbef562268..5d745c9abf05 100644
>>> --- a/drivers/vfio/pci/vfio_pci_core.c
>>> +++ b/drivers/vfio/pci/vfio_pci_core.c
>>> @@ -2429,10 +2429,18 @@ static int vfio_pci_dev_set_hot_reset(struct
>> vfio_device_set *dev_set,
>>>  	list_for_each_entry(cur_vma, &dev_set->device_list, vdev.dev_set_list) {
>>>  		/*
>>> -		 * Test whether all the affected devices are contained by the
>>> -		 * set of groups provided by the user.
>>> +		 * Test whether all the affected devices can be reset by the
>>> +		 * user.
>>> +		 *
>>> +		 * Resetting an unused device (not opened) is safe, because
>>> +		 * dev_set->lock is held in hot reset path so this device
>>> +		 * cannot race being opened by another user simultaneously.
>>> +		 *
>>> +		 * Otherwise all opened devices in the dev_set must be
>>> +		 * contained by the set of groups provided by the user.
>>>  		 */
>>> -		if (!vfio_dev_in_groups(cur_vma, groups)) {
>>> +		if (cur_vma->vdev.open_count &&
>>> +		    !vfio_dev_in_groups(cur_vma, groups)) {
>>>  			ret = -EINVAL;
>>>  			goto err_undo;
>>>  		}
>>> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
>>> index 0552e8dcf0cb..f96e5689cffc 100644
>>> --- a/include/uapi/linux/vfio.h
>>> +++ b/include/uapi/linux/vfio.h
>>> @@ -673,6 +673,14 @@ struct vfio_pci_hot_reset_info {
>>>   * VFIO_DEVICE_PCI_HOT_RESET - _IOW(VFIO_TYPE, VFIO_BASE + 13,
>>>   *				    struct vfio_pci_hot_reset)
>>>   *
>>> + * Userspace requests hot reset for the devices it uses.  Due to the
>>> + * underlying topology, multiple devices can be affected in the reset
>> by the reset
>>> + * while some might be opened by another user.  To avoid interference
>> s/interference/hot reset failure?
> I don’t think user can really avoid hot reset failure since there may
> be new devices plugged into the affected slot. Even user has opened
I don't know the legacy wrt that issue but this sounds a serious issue,
meaning the reset of an assigned device could impact another device
belonging to another group not not owned by the user?
> all the groups/devices reported by VFIO_DEVICE_GET_PCI_HOT_RESET_INFO,
> the hot reset can fail if new device is plugged in and has not been
> bound to vfio or opened by another user during the window of
> _INFO and HOT_RESET.
with respect to the latter isn't the dev_set lock held during the hot
reset and sufficient to prevent any new opening to occur?
>
> maybe the whole statement should be as below:
>
> To avoid interference, the hot reset can only be conducted when all
> the affected devices are either opened by the calling user or not
> opened yet at the moment of the hot reset attempt.

OK

Eric
>
>>> + * the calling user must ensure all affected devices, if opened, are
>>> + * owned by itself.
>>> + *
>>> + * The ownership is proved by an array of group fds.
>>> + *
>>>   * Return: 0 on success, -errno on failure.
>>>   */
>>>  struct vfio_pci_hot_reset {
> Regards,
> Yi Liu

